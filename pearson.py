import pandas as pd
import numpy as np
from scipy.stats import pearsonr
from scipy.stats import f_oneway
import matplotlib.pyplot as plt

data = {'risk_score': [10.36, 24.92, 15.66, 10.10, 100.00, 23.19, 9.79, 51.68, 0.64, 1.27, 78.34, 7.70, 1.41, 2.80, 100.00, 10.04, 19.41, 9.27, 0.04, 0.70, 100.00, 100.00, 0.84, 15.58, 11.51, 15.96, 2.23, 92.67, 5.08, 4.17, 46.56, 8.43, 99.55, 14.68, 100.00, 9.93, 0.05, 27.89, 7.35, 10.44, 9.30, 1.31, 1.57, 1.53, 0.17, 4.16, 1.65, 0.78, 100.00, 1.44, 13.94, 8.18, 0.13, 0.25, 100.00, 29.53, 1.04, 29.08],
        'randomforest_risk_score': [0, 24.58, 15.93, 10.31, 100, 0, 9.89, 46.12, 0, 0, 73.81, 0, 0, 0, 100, 0, 18.61, 0, 0, 0, 100, 100, 0.95, 0, 13.8, 15.52, 0, 88.33, 0, 0, 0, 8.8, 0, 13.7, 0, 0, 0, 9.31, 0, 9.47, 0, 0, 0, 0, 0, 5.84, 0, 2.92, 95.7, 0, 14.5, 7.91, 0, 0, 100, 28.66, 0, 31.08]}

df = pd.DataFrame(data)

# perform ANOVA
f_value, p_value = f_oneway(df['risk_score'], df['randomforest_risk_score'])

corr, p_value = pearsonr(df['risk_score'], df['randomforest_risk_score'])
print(f"Pearson correlation coefficient: {corr:.2f}")
print(f"P-value: {p_value:.4f}")

# print results
print(f"One-way ANOVA F-value: {f_value:.2f}")
print(f"P-value: {p_value:.4f}")

plt.scatter(df['risk_score'], df['randomforest_risk_score'])
plt.xlabel('Risk Score')
plt.ylabel('Random Forest Risk Score')
plt.show()

range_A = np.max(df['risk_score']) - np.min(df['risk_score'])
range_B = np.max(df['randomforest_risk_score']) - np.min(df['randomforest_risk_score'])

std_A = np.std(df['risk_score'])
std_B = np.std(df['randomforest_risk_score'])

print(f"Range for A: {range_A:.2f}")
print(f"Range for B: {range_B:.2f}")
print(f"Standard deviation for A: {std_A:.2f}")
print(f"Standard deviation for B: {std_B:.2f}")
