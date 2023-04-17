import numpy as np
import pandas as pd
import pickle
import joblib
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix, mean_squared_error, r2_score, precision_score
from sklearn.ensemble import RandomForestRegressor

# Load the dataset
df = pd.read_csv('risk_scores.csv')

# Define the input features and target variable
X = df[['sex', 'age', 'smoker', 'total_chol', 'hdl_chol', 'sbp', 'treated_bp']]
y = df['risk_score']

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=123)

# Train the Random Forest Regressor model
rf = RandomForestRegressor(n_estimators=100, random_state=123)
rf.fit(X_train, y_train)

# Make predictions on the testing set
y_pred = rf.predict(X_test)

# Calculate MSE and R-squared
mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)
print("MSE:", mse)
print("R-squared:", r2)

# Creating a pickle file for the classifier
with open('model.pkl', 'wb') as f:
    pickle.dump(rf, f)

