import streamlit as st
import pandas as pd 
import joblib

model = joblib.load('risk_model.ipynb')
st.title('Health Risk Stratification App')
age = st.number_input('Enter Age', min_value=0, max_value=120, value=30)
length_of_stay = st.number_input('Enter Length of Stay (in days)', min_value=0, value=1)
treatment_cost = st.number_input('Enter Treatment Cost', min_value=0.0)
if st.button('Predict Risk'):
    
    input_data = pd.DataFrame([[age, length_of_stay,treatment_cost]], columns=['Age', 'LengthOfStay', 'TreatmentCost'])
    prediction = model.predict(input_data)
    # abnormal_lab_count = st.number_input('Enter Abnormal Lab Count', min_value=0, value=0)
    probability = model.predict_proba(input_data)[0][1]
    risk = 'High Risk' if prediction == 1 else 'Low Risk'

    st.write(f'The patient(risk prediction) is classified as: {risk}')

    st.write(f'Probability of being high risk: {round(probability, 2)}')