import numpy as np
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
import joblib
from sklearn.metrics import mean_squared_error, r2_score
from sklearn.model_selection import train_test_split,cross_val_score


# Set random seed for reproducibility
np.random.seed(123)

# Generate 10000 random observations for each predictor
age = np.random.randint(30, 79, size=10000)
sex = np.random.choice(['1', '0'], size=10000)
total_chol = np.random.randint(100, 300, size=10000)
hdl_chol = np.random.randint(0, 80, size=10000)
sbp = np.random.randint(80, 200, size=10000)
treated_bp = np.random.choice([0, 1], size=10000)
smoker = np.random.choice([0, 1], size=10000)

# Create a dictionary to hold the data
data = {'age': age,
        'sex': sex,
        'total_chol': total_chol,
        'hdl_chol': hdl_chol,
        'sbp': sbp,
        'treated_bp': treated_bp,
        'smoker': smoker}

# Convert the dictionary to a DataFrame
df = pd.DataFrame(data)

# Define a function to calculate the risk score for men
def calc_risk_men(age, total_chol, hdl_chol, sbp, treated_bp, smoker):
    if age >= 70:
        l = (52.00961 * np.log(age)) + (20.014077 * np.log(total_chol)) - (0.905964 * np.log(hdl_chol)) +  (1.305784 * np.log(sbp)) + (0.241549 * treated_bp) + (12.096316 * smoker) -  (4.605038 * np.log(age) * np.log(total_chol)) + (np.log(70) * smoker) - (2.93323 * np.log(age) * np.log(age)) - 172.300168
        p = 1 - (0.9402 ** np.exp(l))
    else:
        l = (52.00961 * np.log(age)) + (20.014077 * np.log(total_chol)) - (0.905964 * np.log(hdl_chol)) +  (1.305784 * np.log(sbp)) + (0.241549 * treated_bp) + (12.096316 * smoker) - (4.605038 * np.log(age) * np.log(total_chol)) - (2.84367 * np.log(age) * smoker) - (2.93323 * np.log(age) * np.log(age)) - 172.300168 
           
        p = 1 - (0.9402 ** np.exp(l))
    return p

# Define a function to calculate the risk score for women
def calc_risk_women(age, total_chol, hdl_chol, sbp, treated_bp, smoker):
    if age >= 78:
        l = (31.764001 * np.log(age)) + (22.465206 * np.log(total_chol)) - (1.187731 * np.log(hdl_chol)) +  (2.552905 * np.log(sbp)) + (0.420251 * treated_bp) + (13.07543 * smoker) - (5.060998 * np.log(age) * np.log(total_chol)) + (np.log(78) * smoker) - (2.996945 * np.log(age) * np.log(age)) - 146.593306
        p = 1 - (0.98767 ** np.exp(l))
    else:
        l = (31.764001 * np.log(age)) + (22.465206 * np.log(total_chol)) - (1.187731 * np.log(hdl_chol)) +  (2.552905 * np.log(sbp)) + (0.420251 * treated_bp) + (13.07543 * smoker) - (5.060998 * np.log(age) * np.log(total_chol)) - (4.605038 * np.log(age) * np.log(total_chol)) - (2.996945 * np.log(age) * np.log(age)) - 146.593306
        p = 1 - (0.98767 ** np.exp(l))
    return p

df['risk_score'] = df.apply(lambda row: calc_risk_men(row['age'], row['total_chol'], row['hdl_chol'], row['sbp'], row['treated_bp'], row['smoker']) if row['sex'] == '1' else calc_risk_women(row['age'], row['total_chol'], row['hdl_chol'], row['sbp'], row['treated_bp'], row['smoker']), axis=1)

X = df[['age', 'sex', 'total_chol', 'hdl_chol', 'sbp', 'treated_bp', 'smoker']]
y = df['risk_score']


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=123)

# Train the model
rf = RandomForestRegressor(n_estimators=100, random_state=123)
rf.fit(X_train, y_train)

# Calculate MSE and R-squared
y_pred = rf.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)
print("MSE:", mse)
print("R-squared:", r2)

#Calculate the RMSE
rmse = np.sqrt(mean_squared_error(y_test, y_pred))
print('RMSE:', rmse)


#Perform 10-fold cross-validation
cv_scores = cross_val_score(rf, X, y, cv=10)
print('Cross-validation scores:', cv_scores)

#Calculate the F-test score
n = len(y_test)
p = X_test.shape[1]
f_test = (r2 / (1 - r2)) * ((n - p - 1) / p)
print('F-test score:', f_test)


# Save the trained model to a file
joblib.dump(rf, 'model.joblib')




