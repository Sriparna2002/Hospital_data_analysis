CREATE DATABASE hospitalanalysis;

USE hospitalanalysis;

DROP TABLE IF EXISTS Hospital_Data;
CREATE TABLE Hospital_Data(
	Hospital_Name VARCHAR(100),
    Location VARCHAR(100),
    Department VARCHAR(50),
    Doctors_Count INT,
    Patients_Count INT,
    Admission_Date DATE,
    Discharge_Date DATE,
    Medical_Expenses DECIMAL(10,2)
);
desc hospital_data;
select * from hospital_data;

