from flask import Flask, flash, render_template, request, redirect, url_for, session,abort, request
from flask_mysqldb import MySQL
import MySQLdb.cursors
from datetime import datetime, timedelta
from datetime import date
import mysql.connector
import re
import decimal
from flask_paginate import Pagination, get_page_parameter
import mysql.connector
from mysql.connector import Error
import mysql.connector
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
import numpy as np
import joblib
import pickle
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.model_selection import train_test_split
import secrets
import uuid
import MySQLdb


  
app = Flask(__name__)
  
  
app.secret_key = 'xyzsdfg'
  
app.config['MYSQL_HOST'] = 'us-cdbr-east-06.cleardb.net'
app.config['MYSQL_USER'] = 'bf7577b3f3a6df'
app.config['MYSQL_PASSWORD'] = 'e8d7e398'
app.config['MYSQL_DB'] = 'heroku_595c13ac8015330'
  
mysql = MySQL(app)

# MySQL configurations
app.config['MYSQL_DATABASE_HOST'] = 'us-cdbr-east-06.cleardb.net'
app.config['MYSQL_DATABASE_USER'] = 'bf7577b3f3a6df'
app.config['MYSQL_DATABASE_PASSWORD'] = 'e8d7e398'
app.config['MYSQL_DATABASE_DB'] = 'heroku_595c13ac8015330'
app.config['MYSQL_CONNECT_TIMEOUT'] = 300
mysql.init_app(app) 

@app.route('/dbstatus')
def dbstatus():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT DATABASE();")
        result = cursor.fetchone()
        return "Database connection established. Connected to database: " + result[0]
    except Exception as e:
        return "Error connecting to database: " + str(e)
    
@app.route('/')
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    message = None
    
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
      
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE email = %s AND password = %s', (email, password,))
        user = cursor.fetchone()

        if user:
            session['loggedin'] = True
            session['userid'] = user['userid']
            session['name'] = user['name']
            session['email'] = user['email']
           
            message = 'You have successfully logged in!'
            
            # check if user is admin and log them in
            if user['email'] == 'admin@gmail.com' and user['password'] == 'admin123':
                session['is_admin'] = True
                return redirect(url_for('dashboard'))
            
            else:
                return redirect(url_for('home'))
        
        else:
            error = 'Invalid email or password. Please try again.'
            flash(error, 'danger')

    return render_template('login.html', error=error, message=message)

  
@app.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('userid', None)
    session.pop('email', None)
    return redirect(url_for('login'))
  
@app.route('/register', methods=['GET', 'POST'])
def register():
    message = ''
    alert_type = ''
    if request.method == 'POST' and 'name' in request.form and 'password' in request.form and 'email' in request.form:
        userName = request.form['name']
        password = request.form['password']
        email = request.form['email']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE email = %s', (email,))
        account = cursor.fetchone()
        if account:
            message = 'Account already exists!'
            alert_type = 'warning'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            message = 'Please fill out the form!'
            alert_type = 'danger'
        elif not userName or not password or not email:
            message = 'Please fill out the form!'
            alert_type = 'danger'
        else:
            cursor.execute('INSERT INTO user (name, email, password) VALUES (%s, %s, %s)', (userName, email, password,))
            mysql.connection.commit()
            message = 'You have successfully registered!'
            alert_type = 'success'
    elif request.method == 'POST':
        message = 'Please fill out the form!'
        alert_type = 'danger'
    return render_template('register.html', message=message, alert_type=alert_type)

from flask_mail import Message, Mail
mail = Mail(app)

def send_recovery_email(email, recovery_code):
    msg = Message('Account Recovery', recipients=[email])
    msg.body = f"Your account recovery code is {recovery_code}. Please use this code to recover your account."
    mail.send(msg)


@app.route('/account_recovery', methods=['GET', 'POST'])
def account_recovery():
    error = None
    message = None

    if request.method == 'POST':
        email = request.form['email']

        # Check if email exists in the database
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE email = %s', (email,))
        user = cursor.fetchone()

        if user:
            # Generate a unique recovery code and save it in the database
            recovery_code = str(uuid.uuid4())
            cursor.execute('UPDATE user SET recovery_code = %s WHERE email = %s', (recovery_code, email,))
            mysql.connection.commit()

            # Send the recovery code to the user's email
            send_recovery_email(email, recovery_code)

            message = 'An email with instructions on how to recover your account has been sent to your email address.'

        else:
            error = 'The email address you entered does not exist in our database.'

    return render_template('account_recovery.html', error=error, message=message)




@app.route('/Family')
def Family():
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    cur = mysql.connection.cursor()
    search_query = request.args.get('search')
    if search_query:
        cur.execute("SELECT COUNT(*) FROM family_record WHERE family_id LIKE %s OR family_name LIKE %s", (f"%{search_query}%",f"%{search_query}%"))
        total_records = cur.fetchone()[0]

        cur.execute("SELECT * FROM family_record WHERE family_id LIKE %s OR family_name LIKE %s LIMIT %s OFFSET %s", (f"%{search_query}%",f"%{search_query}%", per_page, (page - 1) * per_page))
    else:
        cur.execute("SELECT COUNT(*) FROM family_record")
        total_records = cur.fetchone()[0]

        cur.execute("SELECT * FROM family_record LIMIT %s OFFSET %s", (per_page, (page - 1) * per_page))

    data = cur.fetchall()
    cur.close()

    if not data:
        message = "No records found."
    else:
        message = ""

    pagination = Pagination(page=page, total=total_records, per_page=per_page)

    return render_template('user/family_record.html', family_record=data, message=message, pagination=pagination)


# Add Family Record
@app.route('/insert_family', methods = ['POST'])
def insert_family():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        if 'family_name' in request.form:
             family_name = request.form['family_name']
        else:
            flash("Family Name is required")
        if 'address' in request.form:
             address = request.form['address']
        else:
            flash("Address is required")
        if 'contact_no' in request.form:
             contact_no = request.form['contact_no']
        else:
            flash("Contact_Number is required")

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO family_record (family_name, address,contact_no ) VALUES (%s, %s, %s)", (family_name,address,contact_no))
        mysql.connection.commit()
        return redirect(url_for('Family'))
    
# Delete Family Record
@app.route('/delete_family/<string:family_id_data>', methods = ['GET'])
def delete_family(family_id_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM family_record WHERE family_id=%s", (family_id_data,))
    mysql.connection.commit()
    return redirect(url_for('Family'))


# Update Family Record
@app.route('/update_family', methods= ['POST', 'GET'])
def update_family():
    if request.method == 'POST':
        family_id_data = request.form['family_id']
        family_name = request.form['family_name']
        address = request.form['address']
        contact_no = request.form['contact_no']
        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE family_record SET family_name=%s, address=%s, contact_no=%s
        WHERE family_id=%s
        """, (family_name,address,contact_no, family_id_data))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Family'))
    


@app.route('/view_members/<int:family_id>', methods=['GET'])
def view_members(family_id):
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    cur = mysql.connection.cursor()
    search_query = request.args.get('search')
    if search_query:
            cur.execute("SELECT COUNT(*) FROM patients_record WHERE family_id = %s AND firstname LIKE %s", (family_id, f"%{search_query}%"))
            total_records = cur.fetchone()[0]

            cur.execute("SELECT patients_record.*, consultation_record.systolic FROM patients_record LEFT JOIN consultation_record ON patients_record.patients_id = consultation_record.patients_id WHERE patients_record.family_id = %s AND patients_record.firstname LIKE %s LIMIT %s OFFSET %s", (family_id, f"%{search_query}%", per_page, (page - 1) * per_page))

    else:
            cur.execute("SELECT COUNT(*) FROM patients_record WHERE family_id = %s", (family_id,))
            total_records = cur.fetchone()[0]

            cur.execute("SELECT patients_record.*, consultation_record.systolic FROM patients_record LEFT JOIN consultation_record ON patients_record.patients_id = consultation_record.patients_id WHERE patients_record.family_id = %s AND patients_record.firstname LIKE %s LIMIT %s OFFSET %s", (family_id, '%', per_page, (page - 1) * per_page))

    data = cur.fetchall()
    cur.close()

    if not data:
            message = "No records found."
    else:
            message = ""
            
    pagination = Pagination(page=page, total=total_records, per_page=per_page)

    return render_template('user/view_members.html', patients_record=data, message=message, family_id=family_id, pagination=pagination)


   
# Home
@app.route('/home')
def home():
    schedule = {
        'Monday': {'time': '8:00am - 4:00pm', 'activity': 'Check up'},
        'Tuesday': {'time': '8:00am - 12:00pm', 'activity': 'National Immunization Program (Proper)'},
        'Tuesday (afternoon)': {'time': '1:00pm - 4:00pm', 'activity': 'Prenatal (Proper)'},
        'Wednesday': {'time': '8:00am - 12:00pm', 'activity': 'National Immunization Program (NHA)'},
        'Wednesday (afternoon)': {'time': '1:00pm - 4:00pm', 'activity': 'Check up'},
        'Thursday': {'time': '8:00am - 12:00pm', 'activity': 'Check up'},
        'Thursday (afternoon)': {'time': '1:00pm - 4:00pm', 'activity': 'NTP'},
        'Friday': {'time': '8:00am - 12:00pm', 'activity': 'Prenatal'},
        'Friday (afternoon)': {'time': '1:00pm - 4:00pm', 'activity': 'Family Planning'}
    }
    return render_template('user/index.html', schedule=schedule)

@app.route('/Index')
def Index():
    cur = mysql.connection.cursor()
    search_query = request.args.get('search')
    if search_query:
        cur.execute("SELECT * FROM patients_record WHERE patients_id like %s OR firstname LIKE %s OR lastname LIKE %s", (f"%{search_query}%",f"%{search_query}%", f"%{search_query}%"))
    else:
        cur.execute("SELECT * FROM patients_record")
    data = cur.fetchall()
    cur.close()

    if not data:
        message = "No records found."
    else:
        message = ""

    return render_template('user/patients_record.html', patients_record=data, message=message)

@app.route('/insert_members', methods=['POST'])
def insert_members():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        family_id = request.form['family_id']
        
        lastname = request.form['lastname']    
        firstname = request.form['firstname']
        middlename = request.form['middlename']
        suffix = request.form['suffix']
        address = request.form['address']
        birthday = datetime.strptime(request.form['birthday'], '%Y-%m-%d').date()

        # Compute age based on birthday
        today = date.today()
        age = today.year - birthday.year - ((today.month, today.day) < (birthday.month, birthday.day))

        
        sex = request.form['sex']
        contact_no = request.form['contact_no']
        
        
        cur = mysql.connection.cursor()
        
        # Get the maximum patient_id for the given family_id
        cur.execute("SELECT MAX(patients_id) FROM patients_record WHERE family_id = %s", [family_id])
        max_patients_id = cur.fetchone()[0]
        
        # Increment the patient_id by 1
        if max_patients_id is None:
            patients_id = 1
        else:
            patients_id = max_patients_id + 1
            
        # Insert the new patient record into patients_record table
        cur.execute("INSERT INTO patients_record (family_id,lastname, firstname, middlename, suffix, address, birthday, age, sex, contact_no) VALUES ( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (family_id,lastname, firstname, middlename, suffix, address, birthday, age, sex, contact_no))
        
        # Update the patient_id for the given family_id in the family_record table
        cur.execute("UPDATE family_record SET patients_id = %s WHERE family_id = %s", [patients_id, family_id])
        
        mysql.connection.commit()
        
        return redirect(url_for('Family'))


# Add Consultation Record in View Consultation 
@app.route('/insert_view_members', methods=['POST'])
def insert_view_members():
     if request.method == "POST":
        flash("Data Inserted Successfully")
        family_id = request.form['family_id']
        
        lastname = request.form['lastname']    
        firstname = request.form['firstname']
        middlename = request.form['middlename']
        suffix = request.form['suffix']
        address = request.form['address']
        birthday = datetime.strptime(request.form['birthday'], '%Y-%m-%d').date()

        # Compute age based on birthday
        today = date.today()
        age = today.year - birthday.year - ((today.month, today.day) < (birthday.month, birthday.day))

        sex = request.form['sex']
        contact_no = request.form['contact_no']
        
        # Concatenate all selected systems into a comma-separated string
        systems = ",".join(request.form.getlist("systems"))
        # Concatenate all selected past medical record into a comma-separated string
        past_medical = ",".join(request.form.getlist("past_medical"))
        # Concatenate all selected family medical record into a comma-separated string
        family_medical = ",".join(request.form.getlist("family_medical"))
        
        cur = mysql.connection.cursor()
        
        # Get the maximum patient_id for the given family_id
        cur.execute("SELECT MAX(patients_id) FROM patients_record WHERE family_id = %s", [family_id])
        max_patients_id = cur.fetchone()[0]
        
        # Increment the patient_id by 1
        if max_patients_id is None:
            patients_id = 1
        else:
            patients_id = max_patients_id + 1
            
        # Insert the new patient record into patients_record table
        cur.execute("INSERT INTO patients_record (family_id,lastname, firstname, middlename, suffix, address, birthday, age, sex, contact_no,systems,past_medical,family_medical) VALUES ( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s,%s)", (family_id, lastname, firstname, middlename, suffix, address, birthday, age, sex, contact_no, systems,past_medical,family_medical))
        
        # Update the patient_id for the given family_id in the family_record table
        cur.execute("UPDATE family_record SET patients_id = %s WHERE family_id = %s", [patients_id, family_id])
        
        mysql.connection.commit()
        
        return redirect(url_for('Family'))

# Delete Patients Record
@app.route('/delete/<string:patients_id_data>', methods = ['GET'])
def delete(patients_id_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM patients_record WHERE patients_id=%s", (patients_id_data,))
    mysql.connection.commit()
    return redirect(url_for('Family'))


@app.route('/update', methods= ['POST', 'GET'])
def update():
    if request.method == 'POST':
        patients_id_data = request.form['patients_id']
        lastname = request.form['lastname']
        firstname = request.form['firstname']
        middlename = request.form['middlename']
        suffix = request.form['suffix']
        address = request.form['address']
        birthday = request.form['birthday']
        
        # Calculate age based on updated birthday
        today = date.today()
        age = today.year - datetime.strptime(birthday, '%Y-%m-%d').year - ((today.month, today.day) < (datetime.strptime(birthday, '%Y-%m-%d').month, datetime.strptime(birthday, '%Y-%m-%d').day))
        
        sex = request.form['sex']
        contact_no = request.form['contact_no']

        # Concatenate all selected systems into a comma-separated string
        systems = ",".join(request.form.getlist("systems"))

        # Concatenate all selected systems into a comma-separated string
        past_medical = ",".join(request.form.getlist("past_medical"))

        # Concatenate all selected systems into a comma-separated string
        family_medical = ",".join(request.form.getlist("family_medical"))
       
        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE patients_record 
        SET lastname=%s, firstname=%s, middlename=%s, suffix=%s, address=%s, birthday=%s, age=%s, sex=%s, contact_no=%s, systems=%s, past_medical=%s,family_medical=%s
        WHERE patients_id=%s

        """, (lastname,firstname,middlename,suffix,address,birthday,age,sex,contact_no,systems,past_medical,family_medical, patients_id_data))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Family'))


# Display Consultation Record    
@app.route('/Consultation', methods=['GET'])
def Consultation():
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    cur = mysql.connection.cursor()
    search_query = request.args.get('search')
    if search_query:
        cur.execute("SELECT COUNT(*) FROM patients_record pr INNER JOIN consultation_record cr ON pr.patients_id = cr.patients_id WHERE pr.patients_id like %s OR pr.firstname LIKE %s OR pr.lastname LIKE %s", (f"%{search_query}%", f"%{search_query}%", f"%{search_query}%"))
        total_records = cur.fetchone()[0]

        cur.execute("SELECT cr.patients_id, cr.consultation_number, pr.lastname, pr.firstname, pr.middlename, cr.systolic,cr.diastolic, cr.pulse_rate, cr.weight, cr.height, cr.temperature, cr.allergies, cr.consultation, cr.diagnosis, cr.medicine_treatment, cr.treatment_date,cr.encoder, cr.remarks, cr.consultant,cr.onset_date,cr.encoded_date FROM patients_record pr INNER JOIN consultation_record cr ON pr.patients_id = cr.patients_id WHERE pr.patients_id like %s OR pr.firstname LIKE %s OR pr.lastname LIKE %s LIMIT %s OFFSET %s", (f"%{search_query}%", f"%{search_query}%", f"%{search_query}%", per_page, (page - 1) * per_page))
    else:
        cur.execute("SELECT COUNT(*) FROM consultation_record")
        total_records = cur.fetchone()[0]

        cur.execute("SELECT cr.patients_id, cr.consultation_number, pr.lastname, pr.firstname, pr.middlename, cr.systolic,cr.diastolic, cr.pulse_rate, cr.weight, cr.height, cr.temperature, cr.allergies, cr.consultation, cr.diagnosis, cr.medicine_treatment, cr.treatment_date,cr.encoder, cr.remarks, cr.consultant,cr.onset_date,cr.encoded_date FROM patients_record pr INNER JOIN consultation_record cr ON pr.patients_id = cr.patients_id LIMIT %s OFFSET %s", (per_page, (page - 1) * per_page))

    data = cur.fetchall()
    cur.close()

    if not data:
        message = "No records found."
    else:
        message = ""

    pagination = Pagination(page=page, total=total_records, per_page=per_page)

    return render_template('user/consultation_records.html', consultation_record=data, message=message, pagination=pagination)



@app.route('/view_consultations/<int:patients_id>', methods=['GET'])
def view_consultations(patients_id):
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    cur = mysql.connection.cursor()
    cur.execute("SELECT COUNT(*) FROM consultation_record WHERE patients_id = %s", (patients_id,))
    total_records = cur.fetchone()[0]

    cur.execute("SELECT * FROM consultation_record WHERE patients_id = %s ORDER BY treatment_date DESC LIMIT %s OFFSET %s", (patients_id, per_page, (page - 1) * per_page))
    data = cur.fetchall()
    cur.close()

    if not data:
        message = "No records found."
    else:
        message = ""

    pagination = Pagination(page=page, total=total_records, per_page=per_page)

    return render_template('user/view_consultations.html', consultation_record=data, message=message, pagination=pagination)



# Add Consultation Record in View Consultation 
@app.route('/insert_view_consultation', methods=['POST'])
def insert_view_consultation():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        patients_id = request.form['patients_id']
        
        # get the maximum consultation number for the patient
        cur = mysql.connection.cursor()
        cur.execute("SELECT MAX(consultation_number) FROM consultation_record WHERE patients_id = %s", [patients_id])
        max_consultation_number = cur.fetchone()[0]
        
        # increment the consultation number by 1
        if max_consultation_number is None:
            consultation_number = 1
        else:
            consultation_number = max_consultation_number + 1
            
        bp = request.form['bp']    
        pulse_rate = decimal.Decimal(request.form['pulse_rate'])
        weight = decimal.Decimal(request.form['weight'])
        height = decimal.Decimal(request.form['height'])
        temperature = decimal.Decimal(request.form['temperature'])
        allergies = request.form['allergies']
        consultation = request.form['consultation']
        diagnosis = request.form['diagnosis']
        medicine_treatment = request.form['medicine_treatment']
        remarks = request.form['remarks']
        treatment_date = datetime.now()
        encoder = session.get('name')  # get the user_id of the currently logged-in user
        consultant = request.form['consultant']
        cur.execute("INSERT INTO consultation_record (patients_id, bp, pulse_rate, weight, height, temperature, allergies, consultation, diagnosis, medicine_treatment, treatment_date, remarks, encoder,consultant) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s)", (patients_id, bp, pulse_rate, weight, height, temperature, allergies, consultation, diagnosis, medicine_treatment, treatment_date, remarks, encoder,consultant))
        mysql.connection.commit()
        
        # update the consultation number in the patients_record table
        cur.execute("UPDATE patients_record SET consultation_number = %s WHERE patients_id = %s", [consultation_number, patients_id])
        mysql.connection.commit()
        
        return redirect(url_for('Consultation'))


# Update View Consultation Record  
@app.route('/update_view_consultation', methods= ['POST', 'GET'])
def update_view_consultation():
    if request.method == 'POST':
        consultation_number = request.form['consultation_number']
        systolic = (request.form['systolic'])
        diastolic = (request.form['diastolic'])
        pulse_rate = decimal.Decimal(request.form['pulse_rate'])
        weight = decimal.Decimal(request.form['weight'])
        height = decimal.Decimal(request.form['height'])
        temperature = decimal.Decimal(request.form['temperature'])
        allergies = request.form['allergies']
        consultation = request.form['consultation']
        diagnosis = request.form['diagnosis']
        medicine_treatment = request.form['medicine_treatment']
        onset_date = request.form['onset_date']
        encoded_date = request.form['encoded_date']
        treatment_date = datetime.now()
        remarks = request.form['remarks']
        consultant = request.form['consultant']
        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE consultation_record SET  systolic=%s,diastolic=%s, pulse_rate=%s, weight=%s, height=%s, temperature=%s, allergies=%s, consultation=%s, diagnosis=%s, medicine_treatment=%s, treatment_date=%s, remarks=%s,consultant=%s,onset_date=%s,encoded_date=%s
        WHERE consultation_number=%s
        """, (systolic,diastolic,pulse_rate,weight,height,temperature,allergies,consultation,diagnosis,medicine_treatment, treatment_date, remarks,consultant,onset_date,encoded_date, consultation_number))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Consultation'))
    
# Add Consultation Record  
@app.route('/insert_consultation', methods=['POST'])
def insert_consultation():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        patients_id = request.form['patients_id']
        
        # get the maximum consultation number for the patient
        cur = mysql.connection.cursor()
        cur.execute("SELECT MAX(consultation_number) FROM consultation_record WHERE patients_id = %s", [patients_id])
        max_consultation_number = cur.fetchone()[0]
        
        # increment the consultation number by 1
        if max_consultation_number is None:
            consultation_number = 1
        else:
            consultation_number = max_consultation_number + 1
            
        systolic = request.form['systolic']
        diastolic = request.form['diastolic']
        onset_date = request.form['onset_date']  
        encoded_date = request.form['encoded_date']      
        pulse_rate = decimal.Decimal(request.form['pulse_rate'])
        weight = decimal.Decimal(request.form['weight'])
        height = decimal.Decimal(request.form['height'])
        temperature = decimal.Decimal(request.form['temperature'])
        allergies = request.form['allergies']
        consultation = request.form['consultation']
        diagnosis = request.form['diagnosis']
        medicine_treatment = request.form['medicine_treatment']
        remarks = request.form['remarks']
        treatment_date = datetime.now()
        encoder = session.get('name')  # get the user_id of the currently logged-in user
        consultant = request.form['consultant']
        cur.execute("INSERT INTO consultation_record (patients_id, systolic,diastolic, pulse_rate, weight, height, temperature, allergies, consultation, diagnosis, medicine_treatment, treatment_date, remarks, encoder,consultant,onset_date,encoded_date) VALUES (%s,%s,%s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s)", (patients_id, systolic,diastolic, pulse_rate, weight, height, temperature, allergies, consultation, diagnosis, medicine_treatment, treatment_date, remarks, encoder,consultant,onset_date,encoded_date))
        mysql.connection.commit()
        
        # update the consultation number in the patients_record table
        cur.execute("UPDATE patients_record SET consultation_number = %s WHERE patients_id = %s", [consultation_number, patients_id])
        mysql.connection.commit()
        
        return redirect(url_for('Consultation'))
 # Delete Consultation Record     
@app.route('/delete_consultation/<string:consultation_number_data>', methods=['GET'])
def delete_consultation(consultation_number_data):
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT patients_id FROM consultation_record WHERE consultation_number = %s", (consultation_number_data,))
        patients_id = cur.fetchone()[0]
        cur.execute("DELETE FROM consultation_record WHERE consultation_number = %s AND patients_id = %s", (consultation_number_data, patients_id,))
        mysql.connection.commit()
        flash("Record Has Been Deleted Successfully")
        return redirect(url_for('Consultation'))
    except Exception as e:
        flash("An error occurred while deleting the record: " + str(e))
        return redirect(url_for('Consultation'))

# Update Consultation Record  
@app.route('/update_consultation', methods= ['POST', 'GET'])
def update_consultation():
    if request.method == 'POST':
        consultation_number = request.form['consultation_number']
        systolic = (request.form['systolic'])
        diastolic = (request.form['diastolic'])
        pulse_rate = decimal.Decimal(request.form['pulse_rate'])
        weight = decimal.Decimal(request.form['weight'])
        height = decimal.Decimal(request.form['height'])
        temperature = decimal.Decimal(request.form['temperature'])
        allergies = request.form['allergies']
        consultation = request.form['consultation']
        diagnosis = request.form['diagnosis']
        medicine_treatment = request.form['medicine_treatment']
        treatment_date = datetime.now()
        remarks = request.form['remarks']
        consultant = request.form['consultant']
        onset_date = request.form['onset_date']  
        encoded_date = request.form['encoded_date'] 
        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE consultation_record SET  systolic=%s, diastolic=%s, pulse_rate=%s, weight=%s, height=%s, temperature=%s, allergies=%s, consultation=%s, diagnosis=%s,medicine_treatment=%s, treatment_date=%s, remarks=%s,consultant=%s,onset_date=%s,encoded_date=%s
        WHERE consultation_number=%s
        """, (systolic,diastolic,pulse_rate,weight,height,temperature,allergies,consultation,diagnosis,medicine_treatment, treatment_date, remarks,consultant,onset_date,encoded_date, consultation_number))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Consultation'))
    
    
    
# Display Newborn Record      
@app.route('/Newborn')
def Newborn():
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    cur = mysql.connection.cursor()
    search_query = request.args.get('search')
    if search_query:
        cur.execute("SELECT COUNT(*) FROM newborn_record WHERE id like %s OR firstname LIKE %s OR lastname LIKE %s", (f"%{search_query}%",f"%{search_query}%", f"%{search_query}%"))
        total_records = cur.fetchone()[0]

        cur.execute("SELECT * FROM newborn_record WHERE id LIKE %s OR firstname LIKE %s OR lastname LIKE %s LIMIT %s OFFSET %s", (f"%{search_query}%",f"%{search_query}%",f"%{search_query}%", per_page, (page - 1) * per_page))

    else:
        cur.execute("SELECT COUNT(*) FROM newborn_record")
        total_records = cur.fetchone()[0]
        cur.execute("SELECT * FROM newborn_record LIMIT %s OFFSET %s", (per_page, (page - 1) * per_page))
    data = cur.fetchall()
    cur.close()

    if not data:
        message = "No records found."
    else:
        message = ""

    pagination = Pagination(page=page, total=total_records, per_page=per_page)

    return render_template('user/newborn_record.html', newborn_record=data, message=message, pagination=pagination)


# Add Newborn Record  
@app.route('/insert_newborn', methods = ['POST'])
def insert_newborn():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        if 'lastname' in request.form:
             lastname = request.form['lastname']
        else:
            flash("Lastname is required")
        if 'firstname' in request.form:
             firstname = request.form['firstname']
        else:
            flash("Firstname is required")
        middlename = request.form['middlename']
        gname = request.form['gname']
        suffix = request.form['suffix']
        address = request.form['address']
        birthday = request.form['birthday']
        age = request.form['age']
        if 'sex' in request.form:
            sex = request.form['sex']
        else:
            flash("Sex is required")
        contact_no = request.form['contact_no']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO newborn_record (lastname, firstname,middlename,gname,suffix,address,birthday,age,sex,contact_no) VALUES (%s,%s, %s, %s, %s, %s, %s, %s, %s,%s)", (lastname,firstname,middlename,gname,suffix,address,birthday,age,sex,contact_no))
        mysql.connection.commit()
        return redirect(url_for('Newborn'))
    
# Update Newborn Record      
@app.route('/update_newborn', methods= ['POST', 'GET'])
def update_newborn():
    if request.method == 'POST':
        id_data = request.form['id']
        lastname = request.form['lastname']
        firstname = request.form['firstname']
        middlename = request.form['middlename']
        gname = request.form['gname']
        suffix = request.form['suffix']
        address = request.form['address']
        birthday = request.form['birthday']
        age = request.form['age']
        sex = request.form['sex']
        contact_no = request.form['contact_no']
    
        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE newborn_record SET lastname=%s, firstname=%s, middlename=%s, gname=%s, suffix=%s, address=%s, birthday=%s, age=%s,sex=%s, contact_no=%s
        WHERE id=%s
        """, (lastname,firstname,middlename,gname,suffix,address,birthday,age,sex,contact_no,id_data))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Newborn'))

# Delete Newborn Record
@app.route('/delete_newborn/<string:id_data>', methods = ['GET'])
def delete_newborn(id_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM newborn_record WHERE id=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('Newborn'))

# Display Immunization Record  
@app.route('/Immunization', methods=['GET'])
def Immunization():
    # Set up pagination
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    cur = mysql.connection.cursor()
    search_query = request.args.get('search')
    if search_query:
        cur.execute("SELECT COUNT(*) FROM newborn_record nr INNER JOIN immunization_record ir ON nr.id = ir.id WHERE ir.id like %s OR firstname LIKE %s OR lastname LIKE %s", (f"%{search_query}%",f"%{search_query}%", f"%{search_query}%"))
        total_records = cur.fetchone()[0]

        cur.execute("SELECT ir.id, ir.immunization_number, nr.lastname, nr.firstname, nr.middlename, ir.weight, ir.height, ir.immunization, ir.dose, ir.route, ir.immunization_date,ir.encoded,ir.encoder, ir.consultant FROM newborn_record nr INNER JOIN immunization_record ir ON nr.id = ir.id WHERE ir.id like %s OR firstname LIKE %s OR lastname LIKE %s LIMIT %s OFFSET %s", (f"%{search_query}%",f"%{search_query}%", f"%{search_query}%", per_page, (page - 1) * per_page))
    else:
        cur.execute("SELECT COUNT(*) FROM newborn_record nr INNER JOIN immunization_record ir ON nr.id = ir.id")
        total_records = cur.fetchone()[0]

        cur.execute("SELECT ir.id, ir.immunization_number, nr.lastname, nr.firstname, nr.middlename, ir.weight, ir.height, ir.immunization, ir.dose, ir.route, ir.immunization_date,ir.encoded,ir.encoder, ir.consultant FROM newborn_record nr INNER JOIN immunization_record ir ON nr.id = ir.id LIMIT %s OFFSET %s", (per_page, (page - 1) * per_page))

    data = cur.fetchall()
    cur.close()

    if not data:
        message = "No records found."
    else:
        message = ""

    pagination = Pagination(page=page, total=total_records, per_page=per_page)

    return render_template('user/immunization_record.html', immunization_record=data, message=message, pagination=pagination)


# View all Immunization Records 
@app.route('/view_immunization/<int:id>', methods=['GET'])
def view_immunization(id):
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    cur = mysql.connection.cursor()
    cur.execute("SELECT COUNT(*) FROM immunization_record WHERE id = %s", (id,)) 
    total_records = cur.fetchone()[0]

    cur.execute("SELECT * FROM immunization_record WHERE id = %s LIMIT %s OFFSET %s", (id, per_page, (page - 1) * per_page))
    rows = cur.fetchall()
    cur.close()

    if not rows:
        message = "No records found."
    else:
        message = ""

    pagination = Pagination(page=page, total=total_records, per_page=per_page)

    return render_template('user/view_immunization.html', immunization_record=rows, message=message, pagination=pagination)

# Add Immunization Record  
@app.route('/insert_immunization', methods=['POST'])
def insert_immunization():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        id = request.form['id']
        
        # get the maximum immunization number for the patient
        cur = mysql.connection.cursor()
        cur.execute("SELECT MAX(immunization_number) FROM immunization_record WHERE id = %s", [id])
        max_immunization_number = cur.fetchone()[0]
        
        # increment the immunization number by 1
        if max_immunization_number is None:
            immunization_number = 1
        else:
            immunization_number = max_immunization_number + 1
        
        weight = decimal.Decimal(request.form['weight'])
        height = decimal.Decimal(request.form['height'])
        
        # get the selected immunizations
        immunization = request.form['immunization']
        status = request.form['status']
        reason = request.form['reason']
        dose = request.form['dose']
        encoded = request.form['encoded']
        route = request.form['route']
        immunization_date = datetime.now()
        encoder = session.get('name')  # get the user_id of the currently logged-in user
        consultant = request.form['consultant']
        
        # insert the immunization record for each selected immunization
       
        cur.execute("INSERT INTO immunization_record (id, weight, height, immunization, dose, route, immunization_date,encoded, encoder,consultant,status,reason) VALUES (%s, %s, %s, %s, %s, %s, %s, %s,%s, %s,%s,%s)", (id, weight, height, immunization, dose, route, immunization_date,encoded, encoder,consultant,status,reason))
        
        mysql.connection.commit()
        
        # update the immunization number in the newborn_record table
        cur.execute("UPDATE newborn_record SET immunization_number = %s WHERE id = %s", [immunization_number, id])
        mysql.connection.commit()
        
        return redirect(url_for('Newborn'))


    
# Update View Immunization Record  
@app.route('/update_view_immunization', methods= ['POST', 'GET'])
def update_view_immunization():
    if request.method == 'POST':
        immunization_number = request.form['immunization_number']
        weight = decimal.Decimal(request.form['weight'])
        height = decimal.Decimal(request.form['height'])
        immunization=request.form['immunization']
        status=request.form['status']
        reason=request.form['reason']
        dose = request.form['dose']
        encoded = request.form['encoded']
        route = request.form['route']
        immunization_date = datetime.now()
        encoder = session.get('name')  # get the user_id of the currently logged-in user
        consultant=request.form['consultant']
        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE immunization_record SET  weight=%s, height=%s,  dose=%s, route=%s, immunization_date=%s, encoded=%s, encoder=%s,consultant=%s,immunization=%s,status=%s,reason=%s
        WHERE immunization_number=%s
        """, (weight,height,dose,route,immunization_date,encoded,encoder,consultant,immunization,status,reason, immunization_number))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Newborn'))


# Delete Immunization Record 
@app.route('/delete_immunization/<string:immunization_number_data>', methods=['GET'])
def delete_immunization(immunization_number_data):
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT id FROM immunization_record WHERE immunization_number = %s", (immunization_number_data,))
        id = cur.fetchone()[0]
        cur.execute("DELETE FROM immunization_record WHERE immunization_number = %s AND id = %s", (immunization_number_data, id,))
        mysql.connection.commit()
        flash("Record Has Been Deleted Successfully")
        return redirect(url_for('Immunization'))
    except Exception as e:
        flash("An error occurred while deleting the record: " + str(e))
        return redirect(url_for('Immunization'))

# Update Immunization Record 
@app.route('/update_immunization', methods= ['POST', 'GET'])
def update_immunization():
    if request.method == 'POST':
        immunization_number = request.form['immunization_number']
        weight = decimal.Decimal(request.form['weight'])
        height = decimal.Decimal(request.form['height'])
      
        dose = request.form['dose']
        encoded = request.form['encoded']
        route = request.form['route']
        immunization_date = datetime.now
        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE immunization_record SET  weight=%s, height=%s, dose=%s, route=%s, immunization_date=%s, encoded=%s,
        WHERE immunization_number=%s
        """, (weight,height,dose,route, immunization_date,encoded, immunization_number))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Immunization'))

@app.route('/Prenatal', methods=['GET'])
def Prenatal():
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    cur = mysql.connection.cursor()
    search_query = request.args.get('search')
    if search_query:
        cur.execute("SELECT COUNT(*) FROM prenatal_record WHERE name LIKE %s OR address LIKE %s OR husband LIKE %s", (f"%{search_query}%", f"%{search_query}%", f"%{search_query}%"))
        total_records = cur.fetchone()[0]

        cur.execute("SELECT patients_id, name, address, age, birthday, husband, civil_status, contact_no, philhealth_no,lmp,pmp,edc,ob_score,past_medical,family_medical FROM prenatal_record WHERE name LIKE %s OR address LIKE %s OR husband LIKE %s LIMIT %s OFFSET %s", (f"%{search_query}%", f"%{search_query}%", f"%{search_query}%", per_page, (page - 1) * per_page))
    else:
        cur.execute("SELECT COUNT(*) FROM prenatal_record")
        total_records = cur.fetchone()[0]

        cur.execute("SELECT patients_id, name, address, age, birthday, husband, civil_status, contact_no, philhealth_no,lmp,pmp,edc,ob_score,past_medical,family_medical FROM prenatal_record LIMIT %s OFFSET %s", (per_page, (page - 1) * per_page))

    rows = cur.fetchall()
    cur.close()

    if not rows:
        message = "No records found."
    else:
        message = ""

    pagination = Pagination(page=page, total=total_records, per_page=per_page)

    return render_template('user/prenatal_record.html', prenatal_record=rows, message=message, pagination=pagination)



# Add Prenatal Record
@app.route('/insert_prenatal', methods = ['POST'])
def insert_prenatal():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        if 'name' in request.form:
             name = request.form['name']
        else:
            flash("Name is required")
        address = request.form['address']
        age = request.form['age']
        address = request.form['address']
        birthday = request.form['birthday']
        husband = request.form['husband']
        civil_status = request.form['civil_status']
        contact_no = request.form['contact_no']
        philhealth_no = request.form['philhealth_no']
        lmp = request.form['lmp']
        pmp = request.form['pmp']
        edc = request.form['edc']
        ob_score = request.form['ob_score']
        # Concatenate all selected past medical record into a comma-separated string
        past_medical = ",".join(request.form.getlist("past_medical"))
        # Concatenate all selected family medical record into a comma-separated string
        family_medical = ",".join(request.form.getlist("family_medical"))
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO prenatal_record (name, address,birthday,age,husband,civil_status, contact_no,philhealth_no,lmp,pmp,edc,ob_score,past_medical,family_medical ) VALUES (%s,%s, %s, %s, %s, %s, %s, %s,%s,%s,%s,%s,%s,%s)", (name, address,birthday,age,husband,civil_status, contact_no,philhealth_no,lmp,pmp,edc,ob_score,past_medical,family_medical))
        mysql.connection.commit()
        return redirect(url_for('Prenatal'))
    

# Add Prenatal Consultation Record  
@app.route('/insert_prenatal_consultation', methods=['POST'])
def insert_prenatal_consultation():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        patients_id = request.form['patients_id']
        
        # get the maximum consultation number for the patient
        cur = mysql.connection.cursor()
        cur.execute("SELECT MAX(age_in_months) FROM prenatal_consultation WHERE patients_id = %s", [patients_id])
        max_age_in_months = cur.fetchone()[0]
        
        # increment the consultation number by 1
        if  max_age_in_months is None:
            age_in_months = 1
        else:
            age_in_months =  max_age_in_months + 1

        pregnancy_month = request.form['pregnancy_month'] 
        aog = request.form['aog']   
        bp = request.form['bp']    
        pulse_rate = request.form['pulse_rate']  
        respiratory_rate = request.form['respiratory_rate'] 
        weight = request.form['weight']  
        height = decimal.Decimal(request.form['height'])
        temperature = decimal.Decimal(request.form['temperature'])
        bmi = request.form['bmi'] 
        fundic_height = request.form['fundic_height'] 
        fetal_heart_tone = request.form['fetal_heart_tone']  
        presentation = request.form['presentation'] 
        unconscious_convulsing = request.form['unconscious_convulsing'] 
        vaginal_bleeding = request.form['vaginal_bleeding'] 
        abdominal_pain = request.form['abdominal_pain']
        looks = request.form['looks']  
        headache = request.form['headache'] 
        breathing = request.form['breathing'] 
        fever = request.form['fever'] 
        vomiting = request.form['vomiting'] 
        edema = request.form['edema'] 
        laboratory_utz = request.form['laboratory_utz'] 
        tetanus_toxoid = request.form['tetanus_toxoid'] 
        iron = request.form['iron'] 
        antibiotics = request.form['antibiotics'] 
        check_up = request.form['check_up'] 
        date=datetime.now()
        encoded = request.form['encoded'] 
        encoder = session.get('name')
        consultant = request.form['consultant'] 
        
        cur.execute("INSERT INTO prenatal_consultation (patients_id, pregnancy_month, aog, bp, pulse_rate, respiratory_rate,weight, height, temperature, bmi, fundic_height, fetal_heart_tone, presentation, unconscious_convulsing, vaginal_bleeding, abdominal_pain,looks,headache,breathing,fever,vomiting,edema,laboratory_utz,tetanus_toxoid,iron,antibiotics,check_up,encoder,date,consultant,encoded) VALUES (%s,%s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s,%s)", (patients_id, pregnancy_month, aog, bp, pulse_rate, respiratory_rate,weight, height, temperature, bmi, fundic_height, fetal_heart_tone, presentation, unconscious_convulsing, vaginal_bleeding, abdominal_pain,looks,headache,breathing,fever,vomiting,edema,laboratory_utz,tetanus_toxoid,iron,antibiotics,check_up,encoder,date,consultant,encoded))
        mysql.connection.commit()
        
        # update the consultation number in the patients_record table
        cur.execute("UPDATE prenatal_record SET age_in_months = %s WHERE patients_id = %s", [age_in_months, patients_id])
        mysql.connection.commit()
        
        return redirect(url_for('Prenatal'))
    


@app.route('/insert_gravida', methods=['POST'])
def insert_gravida():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        
        patients_id = request.form['patients_id']
        gravida = request.form['gravida'] 
        term = request.form['term'] 
        wt_sex = request.form['wt_sex'] 
        mode = request.form['mode'] 
        facility = request.form['facility'] 
        complication = request.form['complication'] 
        tt = request.form['tt'] 

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO gravida (patients_id, gravida, term, wt_sex, mode, facility,complication, tt)VALUES (%s,%s, %s,%s, %s, %s, %s,%s)",(patients_id, gravida, term, wt_sex, mode, facility,complication, tt))
        mysql.connection.commit()

        return redirect(url_for('Prenatal'))


# Delete Prenatal Record
@app.route('/delete_gravida/<string:id_data>', methods = ['GET'])
def delete_gravida(id_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM gravida WHERE id=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('Prenatal'))





# View all Prenatal Consultation Records 
@app.route('/view_prenatal_consultation/<int:patients_id>', methods=['GET'])
def view_prenatal_consultation(patients_id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM prenatal_consultation WHERE patients_id = %s", (patients_id,))
    rows = cur.fetchall()
    cur.close()
    return render_template('user/view_prenatal_consultation.html', prenatal_consultation=rows)


# View all Prenatal Consultation Records 
@app.route('/view_gravida/<int:patients_id>', methods=['GET'])
def view_gravida(patients_id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM gravida WHERE patients_id = %s", (patients_id,))
    row = cur.fetchall()
    cur.close()
    return render_template('user/view_gravida.html', gravida=row)





# Update View Immunization Record  
@app.route('/update_view_prenatal', methods= ['POST', 'GET'])
def update_view_prenatal():
    if request.method == 'POST':

        age_in_months = request.form['age_in_months']
        pregnancy_month = request.form['pregnancy_month'] 
        aog = request.form['aog']   
        bp = request.form['bp']    
        pulse_rate = request.form['pulse_rate']  
        respiratory_rate = request.form['respiratory_rate'] 
        weight = request.form['weight']  
        height = decimal.Decimal(request.form['height'])
        temperature = decimal.Decimal(request.form['temperature'])
        bmi = request.form['bmi'] 
        fundic_height = request.form['fundic_height'] 
        fetal_heart_tone = request.form['fetal_heart_tone']  
        presentation = request.form['presentation'] 
        unconscious_convulsing = request.form['unconscious_convulsing'] 
        vaginal_bleeding = request.form['vaginal_bleeding'] 
        abdominal_pain = request.form['abdominal_pain']
        looks = request.form['looks']  
        headache = request.form['headache'] 
        breathing = request.form['breathing'] 
        fever = request.form['fever'] 
        vomiting = request.form['vomiting'] 
        edema = request.form['edema'] 
        laboratory_utz = request.form['laboratory_utz'] 
        tetanus_toxoid = request.form['tetanus_toxoid'] 
        iron = request.form['iron'] 
        antibiotics = request.form['antibiotics'] 
        check_up = request.form['check_up'] 
        date=datetime.now()
        encoded = request.form['encoded'] 
        encoder = session.get('name')
        consultant = request.form['consultant'] 



        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE prenatal_consultation SET  pregnancy_month=%s, aog=%s, bp=%s, pulse_rate=%s, respiratory_rate=%s, weight=%s, height=%s,temperature=%s,bmi=%s,
        fundic_height=%s,fetal_heart_tone=%s,presentation=%s,unconscious_convulsing=%s,vaginal_bleeding=%s,abdominal_pain=%s,looks=%s,headache=%s,breathing=%s,
        fever=%s,vomiting=%s,edema=%s,laboratory_utz=%s,tetanus_toxoid=%s,iron=%s,antibiotics=%s,check_up=%s,date=%s,encoded=%s,encoder=%s,consultant=%s
        WHERE age_in_months=%s
        """, (pregnancy_month,aog,bp,pulse_rate,respiratory_rate,weight,height,temperature,bmi,fundic_height,fetal_heart_tone,presentation,unconscious_convulsing,
              vaginal_bleeding,abdominal_pain, looks,headache,breathing,fever,vomiting,edema,laboratory_utz,tetanus_toxoid,iron,antibiotics,check_up,date,encoded,encoder,consultant, age_in_months))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Prenatal'))
    
# Update View Immunization Record  
@app.route('/update_view_gravida', methods= ['POST', 'GET'])
def update_view_gravida():
    if request.method == 'POST':

        id = request.form['id']
        gravida = request.form['gravida'] 
        term = request.form['term'] 
        wt_sex = request.form['wt_sex'] 
        mode = request.form['mode'] 
        facility = request.form['facility'] 
        complication = request.form['complication'] 
        tt = request.form['tt'] 

        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE gravida SET  gravida=%s, term=%s, wt_sex=%s, mode=%s, facility=%s, complication=%s, tt=%s, id=%s
        """, (gravida,term,wt_sex,mode,facility,complication,tt,id))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Prenatal'))
    

 # Deleete View Prenatal Consultation Record
@app.route('/delete_view_prenatal/<string:age_in_months_data>', methods = ['GET'])
def delete_view_prenatal(age_in_months_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM prenatal_consultation WHERE age_in_months=%s", (age_in_months_data,))
    mysql.connection.commit()
    return redirect(url_for('Prenatal'))



 # Update Prenatal Record
@app.route('/update_prenatal', methods= ['POST', 'GET'])
def update_prenatal():
    if request.method == 'POST':
        patients_id_data = request.form['patients_id']
        name = request.form['name']
        address = request.form['address']
        age = request.form['age']
        birthday = request.form['birthday']
        husband = request.form['husband']
        civil_status = request.form['civil_status']
        contact_no = request.form['contact_no']
        lmp = request.form['lmp']
        pmp = request.form['pmp']
        edc = request.form['edc']
        ob_score = request.form['ob_score']
        philhealth_no = request.form['philhealth_no']
        # Concatenate all selected past medical record into a comma-separated string
        past_medical = ",".join(request.form.getlist("past_medical"))
        # Concatenate all selected family medical record into a comma-separated string
        family_medical = ",".join(request.form.getlist("family_medical"))
        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE prenatal_record SET name=%s, address=%s, birthday=%s, age=%s, husband=%s, civil_status=%s, contact_no=%s,philhealth_no=%s,lmp=%s,pmp=%s,edc=%s,ob_score=%s,past_medical=%s,family_medical=%s
        WHERE patients_id=%s
        """, (name,address,birthday,age,husband,civil_status,contact_no,philhealth_no,lmp,pmp,edc,ob_score,past_medical,family_medical, patients_id_data))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Prenatal'))

# Delete Prenatal Record
@app.route('/delete_prenatal/<string:patients_id_data>', methods = ['GET'])
def delete_prenatal(patients_id_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM prenatal_record WHERE patients_id=%s", (patients_id_data,))
    mysql.connection.commit()
    return redirect(url_for('Prenatal'))


# Display Prediction Record    
@app.route('/Prediction', methods = ['GET'])
def Prediction():
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    cur = mysql.connection.cursor()
    search_query = request.args.get('search')
    if search_query:
        cur.execute("SELECT COUNT(*) FROM patients_record pr INNER JOIN prediction_record prr ON pr.patients_id = prr.patients_id WHERE prr.patients_id LIKE %s OR pr.firstname LIKE %s OR pr.lastname LIKE %s", (f"%{search_query}%", f"%{search_query}%", f"%{search_query}%"))
        total_records = cur.fetchone()[0]

        cur.execute("SELECT prr.patients_id, prr.prediction_number, pr.lastname, pr.firstname, pr.middlename, prr.sex, prr.age, prr.total_chol, prr.hdl_chol, prr.systolic, prr.smoker, prr.treated_bp, prr.risk_score FROM patients_record pr INNER JOIN prediction_record prr ON pr.patients_id = prr.patients_id WHERE prr.patients_id LIKE %s OR pr.firstname LIKE %s OR pr.lastname LIKE %s LIMIT %s OFFSET %s", (f"%{search_query}%", f"%{search_query}%", f"%{search_query}%", per_page, (page - 1) * per_page))
    else:
        cur.execute("SELECT COUNT(*) FROM prediction_record")
        total_records = cur.fetchone()[0]

        cur.execute(" SELECT prr.patients_id, prr.prediction_number, pr.lastname, pr.firstname, pr.middlename, prr.sex, prr.age, prr.total_chol, prr.hdl_chol, prr.systolic,prr.smoker, prr.treated_bp, prr.risk_score FROM patients_record pr INNER JOIN prediction_record prr ON pr.patients_id = prr.patients_id LIMIT %s OFFSET %s", (per_page, (page - 1) * per_page))

        data = cur.fetchall()
    cur.close()

    if not data:
        message = "No records found."
    else:
        message = ""

    pagination = Pagination(page=page, total=total_records, per_page=per_page)

    return render_template('user/prediction_record.html', prediction_record=data, message=message, pagination=pagination)




            
# Add Prediction Record
# Load the trained random forest regressor model from a file
# Load the trained model from the file
rf = joblib.load('model.joblib')

@app.route('/insert_prediction', methods=['POST'])
def insert_prediction():
    if request.method == "POST":
        flash("Data Inserted Successfully")
        patients_id = request.form['patients_id']
        cur = mysql.connection.cursor()
        
       
        # Retrieve age, sex, and systolic blood pressure of selected patient
        cur.execute("SELECT pr.age, pr.sex, cr.systolic FROM patients_record pr INNER JOIN consultation_record cr ON pr.patients_id = cr.patients_id WHERE pr.patients_id = %s", [patients_id])
        patient_data = cur.fetchone()
        age = int(patient_data[0])
        sex = 1 if patient_data[1] == 'Male' else 0
        systolic = int(patient_data[2])


        # Get the maximum prediction number for the patient
        cur.execute("SELECT MAX(prediction_number) FROM prediction_record WHERE patients_id = %s", [patients_id])
        max_prediction_number = cur.fetchone()[0]

        # Check if the prediction number already exists for the patient
        if max_prediction_number is None:
            prediction_number = 1
        else:
            cur.execute("SELECT COUNT(*) FROM prediction_record WHERE patients_id = %s AND prediction_number = %s", (patients_id, max_prediction_number+1))
            prediction_count = cur.fetchone()[0]
            if prediction_count > 0:
                prediction_number = max_prediction_number + 2
            else:
                prediction_number = max_prediction_number + 1

        smoker = int(request.form.get('smoker'))
        total_chol = int(request.form.get('total_chol'))
        hdl_chol = int(request.form.get('hdl_chol'))
      
        treated_bp = int(request.form.get('treated_bp'))
        
        # Use the model to make a prediction on new data
        new_data = [age, sex, total_chol, hdl_chol, systolic, treated_bp, smoker]
        # Convert list to numpy array
        new_data = np.asarray(new_data)

        # Reshape the array
        new_data = new_data.reshape(1, -1)
        # Make predictions on new data
        risk_score = rf.predict(new_data)[0]

        # Insert the new prediction record
        cur.execute("INSERT INTO prediction_record (patients_id,sex, age, smoker, total_chol, hdl_chol, systolic, treated_bp, risk_score) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)", (patients_id, sex, age, smoker, total_chol, hdl_chol, systolic, treated_bp, risk_score))
        mysql.connection.commit()
        cur.execute("UPDATE patients_record SET prediction_number = %s WHERE patients_id = %s", [prediction_number, patients_id])
        mysql.connection.commit()
        return render_template('user/result.html', risk_score=risk_score)

# Delete Prediction Record     
@app.route('/delete_prediction/<string:prediction_number_data>', methods=['GET'])
def delete_prediction(prediction_number_data):
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT patients_id FROM prediction_record WHERE prediction_number = %s", (prediction_number_data,))
        patients_id = cur.fetchone()[0]
        cur.execute("DELETE FROM prediction_record WHERE prediction_number = %s AND patients_id = %s", (prediction_number_data, patients_id,))
        mysql.connection.commit()
        flash("Record Has Been Deleted Successfully")
        return redirect(url_for('Prediction'))
    except Exception as e:
        flash("An error occurred while deleting the record: " + str(e))
        return redirect(url_for('Prediction'))

# Update Prediction Record  
@app.route('/update_prediction', methods= ['POST', 'GET'])
def update_prediction():
    if request.method == 'POST':
        prediction_number = request.form['prediction_number']
        sex = int(request.form.get('sex'))
        age = int(request.form['age'])
        smoker = int(request.form.get('smoker'))
        total_chol = int(request.form.get('total_chol'))
        hdl_chol = int(request.form.get('hdl_chol'))
        sbp = int(request.form.get('sbp'))
        treated_bp = int(request.form.get('treated_bp'))
        

        cur = mysql.connection.cursor()
        cur.execute("""
        UPDATE prediction_record SET  sex=%s, age=%s, smoker=%s, total_chol=%s, hdl_chol=%s, sbp=%s, treated_bp=%s
        """, (sex,age,smoker,total_chol,hdl_chol,sbp,treated_bp, prediction_number))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('Prediction'))
    
from datetime import datetime

@app.route("/total_vaccinated", methods=["POST"])
def total_vaccinated():
    immunization = request.form["immunization"]
    date_str = request.form["date"]
    date = datetime.strptime(date_str, '%Y-%m-%d').strftime('%d/%m/%Y')  # convert date string to datetime object and format to expected string format

    cursor = mysql.connection.cursor()

    cursor.execute("SELECT COUNT(*) FROM newborn_record WHERE sex = 'Male' AND id IN (SELECT id FROM immunization_record WHERE immunization = %s AND immunization_date = %s)", (immunization, date))
    result = cursor.fetchone()
    total_male = result[0] if result else 0

    cursor.execute("SELECT COUNT(*) FROM newborn_record WHERE sex = 'Female' AND id IN (SELECT id FROM immunization_record WHERE immunization = %s AND immunization_date = %s)", (immunization, date))
    result = cursor.fetchone()
    total_female = result[0] if result else 0

    if total_male == 0 and total_female == 0:
        message = "No records found."
        return render_template("admin/dashboard.html", immunization=immunization, date=date_str, message=message)
    else:
        return render_template("admin/dashboard.html", immunization=immunization, date=date_str, total_male=total_male, total_female=total_female)

@app.route('/result', methods=['POST'])
def result():
    today = datetime.now().date()
    cursor = mysql.connection.cursor()
    cursor.execute("""
        SELECT COUNT(*) as count
        FROM immunization_record
        WHERE immunization_date = %s
    """, (today,))
    total_immunization = cursor.fetchone()[0]
    return render_template('admin/dashboard.html', total_immunization=total_immunization)


@app.route("/dashboard")
def dashboard():
    
    return render_template("admin/dashboard.html")
    
@app.route("/total_patients")
def total_patients():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM patients_record")
    result = cursor.fetchone()
    total_patients = result[0]
    return render_template("admin/dashboard.html", total_patients=total_patients)

@app.route("/total_newborn")
def total_newborn():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM newborn_record")
    result = cursor.fetchone()
    total_newborn = result[0]
    return render_template("admin/dashboard.html", total_newborn=total_newborn)

@app.route("/total_immunization")
def total_immunization():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM immunization_record")
    result = cursor.fetchone()
    total_immunization = result[0]
    return render_template("admin/dashboard.html", total_immunization=total_immunization)

@app.route("/total_prediction")
def total_prediction():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM prediction_record")
    result = cursor.fetchone()
    total_prediction = result[0]
    return render_template("admin/dashboard.html", total_prediction=total_prediction)

@app.route("/total_prenatal")
def total_prenatal():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(*) FROM prenatal_record")
    result = cursor.fetchone()
    total_prenatal = result[0]
    return render_template("admin/dashboard.html", total_prenatal=total_prenatal)

@app.route('/graph')
def graph():
    conn = mysql.connector.connect(
        host="us-cdbr-east-06.cleardb.net",
        user="bf7577b3f3a6df",
        password="e8d7e398",
        database="heroku_595c13ac8015330"
    )
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) FROM data")
    total_data = cursor.fetchone()[0]
    conn.close()
    return render_template('admin/dashboard.html', total_data=total_data)   

@app.route("/manage")
def manage():
    cur = mysql.connection.cursor()
    cur.execute("SELECT userid, name, email, password, user_type FROM user")
    rows = cur.fetchall()
    cur.close()
    return render_template('admin/manage_user.html', user=rows)


# Display User's Record  
@app.route('/view', methods=['GET'])
def view():
    
    return render_template('admin/manage_user.html')

# Add user Record
@app.route('/add_user', methods=['GET', 'POST'])
def add_user():
    message = ''
    if request.method == 'POST' and 'name' in request.form and 'password' in request.form and 'email' in request.form and 'user_type' in request.form:
        userName = request.form['name']
        password = request.form['password']
        email = request.form['email']
        user_type = request.form['user_type']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE email = %s', (email,))
        account = cursor.fetchone()
        if account:
            message = 'Account already exists!'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            message = 'Invalid email address!'
        elif not userName or not password or not email or not user_type:
            message = 'Please fill out the form!'
        else:
            cursor.execute('INSERT INTO user (name, email, password, user_type) VALUES (%s, %s, %s, %s)', (userName, email, password, user_type,))
            mysql.connection.commit()
            message = 'You have successfully registered!'
    elif request.method == 'POST':
        message = 'Please fill out the form!'
    return redirect(url_for('manage'))




# Delete User's Record
@app.route('/delete_user/<string:user_id_data>', methods = ['GET'])
def delete_user(user_id_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM user WHERE userid=%s", (user_id_data,))
    mysql.connection.commit()
    return redirect(url_for('manage'))

 # Update Immunization Record 
@app.route('/update_user', methods=['POST', 'GET'])
def update_user():
    if request.method == 'POST':
        userid = request.form['userid']
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']
        user_type = request.form['user_type']
        cur = mysql.connection.cursor()
        cur.execute("""
            UPDATE user SET name=%s, email=%s, password=%s, user_type=%s 
            WHERE userid=%s
        """, (name, email, password, user_type, userid))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('manage'))



# Define route to display user list
@app.route('/users')
def users():
    conn = mysql.connector.connect(
        host="us-cdbr-east-06.cleardb.net",
        user="bf7577b3f3a6df",
        password="e8d7e398",
        database="heroku_595c13ac8015330"
    )
    # Create MySQL cursor
    cursor = conn.cursor()

    # Retrieve user data from database
    cursor.execute("SELECT * FROM user")
    users = cursor.fetchall()

    # Close cursor
    cursor.close()

    # Render HTML template with user data
    return render_template('admin/manage_user.html', users=users)



@app.route('/archive_newborn', methods=['GET', 'POST'])
def archive_newborn():
    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    if request.method == 'POST':
        # Retrieve the ID of the newborn record from the form data
        newborn_id = request.form['id']
        
        

        cursor = mysql.connection.cursor()
        
        # Retrieve the data for the newborn and its corresponding immunization records
        cursor.execute("SELECT * FROM newborn_record WHERE id = %s", (newborn_id,))
        newborn_data = str(cursor.fetchone())
        result = cursor.fetchone()
        if result is not None:
            total_count = result[0]
        else:
            total_count = 0
            
        cursor.execute("SELECT * FROM immunization_record WHERE id = %s", (newborn_id,))
        immunization_data = str(cursor.fetchall())

        # Store the retrieved data in the "Archived Records" table
        cursor.execute("INSERT INTO archived_record (newborn_data, immunization_data) VALUES (%s, %s)", (newborn_data, immunization_data))

        # Delete the data from the original tables
        cursor.execute("DELETE FROM immunization_record WHERE id = %s", (newborn_id,))
        cursor.execute("DELETE FROM newborn_record WHERE id = %s", (newborn_id,))

        # Commit the changes to the database and close the connection
        mysql.connection.commit()
        data = cursor.fetchall()
        cursor.close()

        if not data:
            mesage = "No records found."    
        else:
            mesage = ""

        pagination = Pagination(page=page, total=total_count, per_page=per_page)

        # Display a message on the UI to confirm that the records have been archived
        message = "The records have been archived."
        return render_template('user/newborn_record.html', message=message, mesage=mesage, pagination=pagination)

    # If the request method is GET, display the form to enter the ID of the newborn record
    return render_template('user/newborn_record.html')

@app.route('/archive_patient', methods=['GET', 'POST'])
def archive_patient():
    cursor = mysql.connection.cursor()

    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page

    if request.method == 'POST':
        # Retrieve the ID of the newborn record from the form data
        patient_id = request.form['patients_id']
        family_id =''

        # Retrieve the family ID of the patient
        cursor.execute("SELECT family_id FROM patients_record WHERE patients_id = %s", (patient_id,))
        family_id_result = cursor.fetchone()
        if family_id_result is not None:
            family_id = family_id_result[0]
            # Delete the family ID of the patient from the "patients_record" table
            cursor.execute("UPDATE patients_record SET family_id = NULL WHERE patients_id = %s", (patient_id,))

            # Retrieve the latest patient record from the "patients_record" table
            cursor.execute("SELECT * FROM patients_record WHERE patients_id = %s", (patient_id,))
            patient_data = str(cursor.fetchone())
            result = cursor.fetchone()
            if result is not None:
                total_count = result[0]
            else:
                total_count = 0

            cursor.execute("SELECT * FROM consultation_record WHERE patients_id = %s", (patient_id,))
            consultation_data = str(cursor.fetchall())

            cursor.execute("SELECT * FROM prediction_record WHERE patients_id = %s", (patient_id,))
            prediction_data = str(cursor.fetchall())

            # Store the retrieved data in the "Archived Records" table
            cursor.execute("INSERT INTO archived_patients_record (patient_data, prediction_data, consultation_data) VALUES (%s, %s, %s)", (patient_data, prediction_data, consultation_data))

            # Delete the data from the original tables
            cursor.execute("DELETE FROM prediction_record WHERE patients_id = %s", (patient_id,))
            cursor.execute("DELETE FROM consultation_record WHERE patients_id = %s", (patient_id,))
            cursor.execute("DELETE FROM patients_record WHERE patients_id = %s", (patient_id,))

            # Commit the changes to the database and close the connection
            mysql.connection.commit()
            cursor.close()
            data = cursor.fetchall()

            if not data:
                mesage = "No records found."
            else:
                mesage = ""

            pagination = Pagination(page=page, total=total_count, per_page=per_page)

            # Display a message on the UI to confirm that the records have been archived
            message = "The records have been archived."
            return render_template('user/view_members.html', message=message, mesage=mesage, pagination=pagination)

        else:
            # If no family ID is found for the patient, display an error message on the UI
            message = "The patient record could not be archived as no family ID was found."
            return render_template('user/view_members.html', message=message)

    # If the request method is GET, display the form to enter the ID of the newborn record
    return render_template('user/view_members.html')


@app.route('/archive_prenatal', methods=['GET', 'POST'])
def archive_prenatal():
    cursor = mysql.connection.cursor()

    page = request.args.get(get_page_parameter(), type=int, default=1)
    per_page = 10  # Number of records to display per page


    if request.method == 'POST':
        # Retrieve the ID of the newborn record from the form data
        patient_id = request.form['patients_id']

        # Retrieve the latest patient record from the "patients_record" table
        cursor.execute("SELECT * FROM prenatal_record WHERE patients_id = %s", (patient_id,))
        prenatal_data = str(cursor.fetchone())
        result = cursor.fetchone()
        if result is not None:
            total_count = result[0]
        else:
            total_count = 0

        cursor.execute("SELECT * FROM prenatal_consultation WHERE patients_id = %s", (patient_id,))
        gravida_data = str(cursor.fetchall())

        cursor.execute("SELECT * FROM gravida WHERE patients_id = %s", (patient_id,))
        prenatal_consultation_data = str(cursor.fetchall())

        # Store the retrieved data in the "Archived Records" table
        cursor.execute("INSERT INTO archived_prenatal_record (prenatal_data, gravida_data, prenatal_consultation_data) VALUES (%s, %s, %s)", (prenatal_data, gravida_data, prenatal_consultation_data))

        # Delete the data from the original tables
        cursor.execute("DELETE FROM gravida WHERE patients_id = %s", (patient_id,))
        cursor.execute("DELETE FROM prenatal_consultation WHERE patients_id = %s", (patient_id,))
        cursor.execute("DELETE FROM prenatal_record WHERE patients_id = %s", (patient_id,))

        # Commit the changes to the database and close the connection
        mysql.connection.commit()
        cursor.close()
        data = cursor.fetchall()

        if not data:
            mesage = "No records found."    
        else:
            mesage = ""

        pagination = Pagination(page=page, total=total_count, per_page=per_page)

        # Display a message on the UI to confirm that the records have been archived
        message = "The records have been archived."
        return render_template('user/prenatal_record.html', message=message, mesage=mesage, pagination=pagination)

    # If the request method is GET, display the form to enter the ID of the newborn record
    return render_template('user/prenatal_record.html')

if __name__ == "__main__":
    app.run(debug=True)

