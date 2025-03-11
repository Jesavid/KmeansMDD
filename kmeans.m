% Algoritmo K-Means, el dataset fue obtenido de Kagle y muestra información
% para determinar si un paciente tiene o no diabetes en base a los siguientes
% atributos
% 1. Age: The age of the individual (18-90 years).
% 2. Pregnancies: Number of times the patient has been pregnant.
% 3. BMI (Body Mass Index): A measure of body fat based on height and weight (kg/m²).
% 4. Glucose: Blood glucose concentration (mg/dL), a key diabetes indicator.
% 5. BloodPressure: Systolic blood pressure (mmHg), higher levels may indicate hypertension.
% 6. HbA1c: Hemoglobin A1c level (%), representing average blood sugar over months.
% 7. LDL (Low-Density Lipoprotein): "Bad" cholesterol level (mg/dL).
% 8. HDL (High-Density Lipoprotein): "Good" cholesterol level (mg/dL).
% 9. Triglycerides: Fat levels in the blood (mg/dL), high values increase diabetes risk.
% 10. WaistCircumference: Waist measurement (cm), an indicator of central obesity.
% 11. HipCircumference: Hip measurement (cm), used to calculate WHR.
% 12. WHR (Waist-to-Hip Ratio): Waist circumference divided by hip circumference.
% 13. FamilyHistory: Indicates if the individual has a family history of diabetes (1 = Yes, 0 = No).
% 14. DietType: Dietary habits (0 = Unbalanced, 1 = Balanced, 2 = Vegan/Vegetarian).
% 15. Hypertension: Presence of high blood pressure (1 = Yes, 0 = No).
% 16. MedicationUse: Indicates if the individual is taking medication (1 = Yes, 0 = No).
% 17. Outcome: Diabetes diagnosis result (1 = Diabetes, 0 = No Diabetes).
% -----------------------------------------------------------------------------

% Si no se generaron los datasets, genera los nuevos datasets
%[train_data,test_data]=generateDataSets();
% Si ya están guardados los datasets, cargarlos
train_data = csvread("train_data.csv");
% Normalizar los datos
normalizedDataSet = normalizeData(train_data);
% Generar los plots y descargarlos
% visualizingData(normalizedDataSet);
[adjustedCentroids,assignedClasses] = kMeansCentroidsAdjust(train_data);
% visualizingClassification(train_data, assignedClasses, adjustedCentroids)
