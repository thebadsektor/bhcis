import pandas as pd
from scipy.stats import ttest_ind

# Load data
data = pd.read_csv("Practice.csv")

# T-test between sex and risk_score
sex_ttest = ttest_ind(data[data['sex'] == 0]['risk_score'], 
                      data[data['sex'] == 1]['risk_score'])
print("T-test between sex and risk_score:")
print(sex_ttest)

# T-test between treated_bp and risk_score
treated_bp_ttest = ttest_ind(data[data['treated_bp'] == 0]['risk_score'], 
                             data[data['treated_bp'] == 1]['risk_score'])
print("T-test between treated_bp and risk_score:")
print(treated_bp_ttest)

# T-test between smoker and risk_score
smoker_ttest = ttest_ind(data[data['smoker'] == 0]['risk_score'], 
                         data[data['smoker'] == 1]['risk_score'])
print("T-test between smoker and risk_score:")
print(smoker_ttest)

# T-test between age and risk_score
age_ttest = ttest_ind(data[data['age'] < 50]['risk_score'], 
                      data[data['age'] >= 50]['risk_score'])
print("T-test between age and risk_score:")
print(age_ttest)

# T-test between total_chol and risk_score
total_chol_ttest = ttest_ind(data[data['total_chol'] < 200]['risk_score'], 
                             data[data['total_chol'] >= 200]['risk_score'])
print("T-test between total_chol and risk_score:")
print(total_chol_ttest)

# T-test between hdl_chol and risk_score
hdl_chol_ttest = ttest_ind(data[data['hdl_chol'] < 40]['risk_score'], 
                           data[data['hdl_chol'] >= 40]['risk_score'])
print("T-test between hdl_chol and risk_score:")
print(hdl_chol_ttest)

# T-test between sbp and risk_score
sbp_ttest = ttest_ind(data[data['sbp'] < 120]['risk_score'], 
                      data[data['sbp'] >= 120]['risk_score'])
print("T-test between sbp and risk_score:")
print(sbp_ttest)
