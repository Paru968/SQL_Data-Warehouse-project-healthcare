SELECT TOP (1000) [admission_id]
      ,[admission_date]
      ,[discharge_date]
      ,[admission_type]
      ,[admission_status]
      ,[patient_id]
      ,[department_id]
      ,[ward_id]
      ,[bed_id]
      ,[disease_id]
      ,[batch_id]
      ,[load_datetime]
      ,[source_file_name]
  FROM [HospitalDWH].[bronze].[admission]

  select top (500) * from bronze.admission;

    select top (500) * from bronze.bed;

     select top (500) * from bronze.billing;

     select top (500) * from bronze.billing_detail;

     select top (500) * from bronze.department;
     select top (500) * from bronze.diagnostic_test;
     select top (500) * from bronze.disease;
     select top (500) * from bronze.doctor;

     select top (500) * from bronze.drug;

     select top (500) * from bronze.drug_inventory;

     select top (500) * from bronze.disease;

     select top (500) * from bronze.drug_manufacturer;

     select top (500) * from bronze.employee;

     select top (500) * from bronze.insurance_provider;

      select top (500) * from bronze.patient;
      select top (500) * from bronze.patient_diagnostic;

      select top (500) * from bronze.patient_insurance;

     select top (500) * from bronze.prescription;


     select top (500) * from bronze.staff_assignment;

     select top (500) * from bronze.ward;

     SELECT
    charge_type,
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN reference_id IS NULL THEN 1 ELSE 0 END) AS Null_ReferenceID
FROM bronze.billing_detail
GROUP BY charge_type;

SELECT TOP (20)
    *
FROM bronze.billing_detail
WHERE charge_type = 'Room';


SELECT TOP (20)
    *
FROM bronze.billing_detail
WHERE charge_type = 'Drug';

























