-- 1) Total Number of Patients
-- o Write an SQL query to find the total number of patients across all hospitals.
SELECT SUM(Patients_Count) AS TOTAL_PATIENTS
FROM hospital_data;

-- 2)Average Number of Doctors per Hospital
-- o Retrieve the average count of doctors available in each hospital.
SELECT hospital_name, AVG(Doctors_Count) AS AVERAGE_COUNT_DOCTOR
FROM hospital_data
GROUP BY Hospital_Name;

-- 3)Top 3 Departments with the Highest Number of Patients
-- o Find the top 3 hospital departments that have the highest number of patients.
SELECT Department , SUM(Patients_Count) AS TOTAL_PATIENTS
FROM hospital_data
GROUP BY Department
ORDER BY TOTAL_PATIENTS desc
LIMIT 3;

-- 4. Hospital with the Maximum Medical Expenses
-- o Identify the hospital that recorded the highest medical expenses.
SELECT Hospital_Name, MAX(Medical_Expenses) AS Max_Expenses
FROM hospital_data
GROUP BY Hospital_Name
ORDER BY Max_Expenses DESC
LIMIT 1;

-- 5. Daily Average Medical Expenses
-- o Calculate the average medical expenses per day for each hospital.
SELECT Hospital_Name, 
ROUND(SUM(Medical_Expenses) / NULLIF(SUM(DATEDIFF(Discharge_Date,Admission_Date)),0),2) AS Daily_Expenses
FROM hospital_data
GROUP BY Hospital_Name
ORDER BY Hospital_Name;

-- 6. Longest Hospital Stay
-- o Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT *,
DATEDIFF(Discharge_Date, Admission_Date) AS stay_duration
FROM hospital_data
ORDER BY stay_duration DESC
LIMIT 1;

-- 7. Total Patients Treated Per City
-- o Count the total number of patients treated in each city.
SELECT Location, SUM(Patients_Count) AS Total_Patients
FROM hospital_data
GROUP BY Location
ORDER BY Total_Patients Desc;

-- 8. Average Length of Stay Per Department
-- o Calculate the average number of days patients spend in each department.
SELECT Department,
AVG(DATEDIFF(Discharge_Date,Admission_Date)) AS Average_Stay
FROM hospital_data
GROUP BY Department;

-- 9. Identify the Department with the Lowest Number of Patients
-- o Find the department with the least number of patients.
SELECT Department, SUM(Patients_Count) AS Total_Patients
FROM hospital_data
GROUP BY Department
ORDER BY Total_Patients ASC
LIMIT 1;

-- 10. Monthly Medical Expenses Report
-- • Group the data by month and calculate the total medical expenses for each month.
SELECT DATE_FORMAT(Admission_Date, '%Y-%m') AS Months,
SUM(Medical_Expenses) AS total_medical_expenses
FROM hospital_data
GROUP BY Months
ORDER BY Months;