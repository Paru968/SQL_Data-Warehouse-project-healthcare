INSERT INTO silver.admission
(
    admission_id,
    admission_date,
    discharge_date,
    admission_type,
    admission_status,
    patient_id,
    department_id,
    ward_id,
    bed_id,
    disease_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    admission_id,
    CAST(admission_date AS DATE) AS admission_date,
    CAST(discharge_date AS DATE) AS discharge_date,
    LTRIM(RTRIM(admission_type)) AS admission_type,
    LTRIM(RTRIM(admission_status)) AS admission_status,
    patient_id,
    department_id,
    ward_id,
    bed_id,
    disease_id,
    batch_id,
    load_datetime,
    source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.admission;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.admission;

SELECT COUNT(*) AS Silver_Count
FROM silver.admission;

select top (500) * from silver.admission;


--2. bed
TRUNCATE TABLE silver.bed;
GO

INSERT INTO silver.bed
(
    bed_id,
    bed_number,
    bed_status,
    ward_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    bed_id,
    LTRIM(RTRIM(bed_number)) AS bed_number,
    LTRIM(RTRIM(bed_status)) AS bed_status,
    ward_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.bed;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.bed;

SELECT COUNT(*) AS Silver_Count
FROM silver.bed;


select * from silver.bed;
GO




--billing
TRUNCATE TABLE silver.billing;
GO

INSERT INTO silver.billing
(
    bill_id,
    bill_date,
    total_amount,
    insurance_covered_amount,
    patient_payable_amount,
    payment_status,
    payment_mode,
    admission_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    bill_id,
    bill_date,                                   -- or CAST(bill_date AS DATE)
    total_amount,
    insurance_covered_amount,
    patient_payable_amount,
    LTRIM(RTRIM(payment_status)) AS payment_status,
    LTRIM(RTRIM(payment_mode)) AS payment_mode,
    admission_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.billing;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.billing;

SELECT COUNT(*) AS Silver_Count
FROM silver.billing;
GO


--4.billing_details
TRUNCATE TABLE silver.billing_detail;
GO

INSERT INTO silver.billing_detail
(
    billing_detail_id,
    charge_type,
    reference_id,
    amount,
    bill_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    billing_detail_id,
    LTRIM(RTRIM(charge_type)) AS charge_type,
    ISNULL(reference_id, -1) AS reference_id,
    amount,
    bill_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.billing_detail;
GO

--5.department

TRUNCATE TABLE silver.department;
GO

INSERT INTO silver.department
(
    department_id,
    department_name,
    department_type,
    floor_number,
    status,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    department_id,
    LTRIM(RTRIM(department_name)) AS department_name,
    LTRIM(RTRIM(department_type)) AS department_type,
    floor_number,
    LTRIM(RTRIM(status)) AS status,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.department;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.department;

SELECT COUNT(*) AS Silver_Count
FROM silver.department;
GO

--6 diagonistic_test

TRUNCATE TABLE silver.diagnostic_test
GO

INSERT INTO silver.diagnostic_test
(
    test_id,
    test_name,
    test_category,
    standard_cost,
    department_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    test_id,
    LTRIM(RTRIM(test_name)) AS test_name,
    LTRIM(RTRIM(test_category)) AS test_category,
    standard_cost,
    department_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.diagnostic_test;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.diagnostic_test;

SELECT COUNT(*) AS Silver_Count
FROM silver.diagnostic_test;



--7.diases
TRUNCATE TABLE silver.disease;
GO

INSERT INTO silver.disease
(
    disease_id,
    disease_name,
    disease_category,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    disease_id,
    LTRIM(RTRIM(disease_name)) AS disease_name,
    LTRIM(RTRIM(disease_category)) AS disease_category,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.disease;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.disease;

SELECT COUNT(*) AS Silver_Count
FROM silver.disease;
GO


--doctor

TRUNCATE TABLE silver.doctor;
GO

INSERT INTO silver.doctor
(
    doctor_id,
    employee_id,
    specialization,
    qualification,
    experience_years,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    doctor_id,
    employee_id,
    LTRIM(RTRIM(specialization)) AS specialization,
    LTRIM(RTRIM(qualification)) AS qualification,
    experience_years,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.doctor;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.doctor;

SELECT COUNT(*) AS Silver_Count
FROM silver.doctor;
GO


--drug

TRUNCATE TABLE silver.drug;
GO

INSERT INTO silver.drug
(
    drug_id,
    drug_name,
    brand_name,
    drug_category,
    unit_cost,
    manufacturer_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    drug_id,
    LTRIM(RTRIM(drug_name)) AS drug_name,
    LTRIM(RTRIM(brand_name)) AS brand_name,
    LTRIM(RTRIM(drug_category)) AS drug_category,
    unit_cost,
    manufacturer_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.drug;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.drug;

SELECT COUNT(*) AS Silver_Count
FROM silver.drug;
GO



--Drug Inventory


TRUNCATE TABLE silver.drug_inventory;
GO

INSERT INTO silver.drug_inventory
(
    inventory_id,
    current_stock,
    reorder_level,
    inventory_status,
    last_restock_date,
    drug_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    inventory_id,
    current_stock,
    reorder_level,
    LTRIM(RTRIM(inventory_status)) AS inventory_status,
    LTRIM(RTRIM(last_restock_date)) AS last_restock_date,
    drug_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.drug_inventory;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.drug_inventory;

SELECT COUNT(*) AS Silver_Count
FROM silver.drug_inventory;
GO



--drug_manufacture


TRUNCATE TABLE silver.drug_manufacturer;
GO

INSERT INTO silver.drug_manufacturer
(
    manufacturer_id,
    manufacturer_name,
    country,
    reliability_rating,
    contract_status,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    manufacturer_id,
    LTRIM(RTRIM(manufacturer_name)) AS manufacturer_name,
    LTRIM(RTRIM(country)) AS country,
    reliability_rating,
    LTRIM(RTRIM(contract_status)) AS contract_status,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.drug_manufacturer;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.drug_manufacturer;

SELECT COUNT(*) AS Silver_Count
FROM silver.drug_manufacturer;
GO

TRUNCATE TABLE silver.employee;
GO

INSERT INTO silver.employee
(
    employee_id,
    employee_name,
    gender,
    role,
    employment_type,
    date_of_joining,
    department_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    employee_id,
    LTRIM(RTRIM(employee_name)) AS employee_name,
    LTRIM(RTRIM(gender)) AS gender,
    LTRIM(RTRIM(role)) AS role,
    LTRIM(RTRIM(employment_type)) AS employment_type,
    LTRIM(RTRIM(date_of_joining)) AS date_of_joining,
    department_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.employee;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.employee;

SELECT COUNT(*) AS Silver_Count
FROM silver.employee;
GO


--insurance_provider
TRUNCATE TABLE silver.insurance_provider;
GO

INSERT INTO silver.insurance_provider
(
    insurance_provider_id,
    provider_name,
    provider_type,
    contact_details,
    coverage_limit,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    insurance_provider_id,
    LTRIM(RTRIM(provider_name)) AS provider_name,
    LTRIM(RTRIM(provider_type)) AS provider_type,
    LTRIM(RTRIM(contact_details)) AS contact_details,
    coverage_limit,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.insurance_provider;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.insurance_provider;

SELECT COUNT(*) AS Silver_Count
FROM silver.insurance_provider;
GO


TRUNCATE TABLE silver.patient;
GO

INSERT INTO silver.patient
(
    patient_id,
    gender,
    date_of_birth,
    blood_group,
    city,
    contact_number,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    patient_id,
    LTRIM(RTRIM(gender)) AS gender,
    LTRIM(RTRIM(date_of_birth)) AS date_of_birth,
    LTRIM(RTRIM(blood_group)) AS blood_group,
    LTRIM(RTRIM(city)) AS city,
    LTRIM(RTRIM(contact_number)) AS contact_number,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.patient;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.patient;

SELECT COUNT(*) AS Silver_Count
FROM silver.patient;
GO


--patient

TRUNCATE TABLE silver.patient;
GO

INSERT INTO silver.patient
(
    patient_id,
    gender,
    date_of_birth,
    blood_group,
    city,
    contact_number,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    patient_id,
    LTRIM(RTRIM(gender)) AS gender,
    LTRIM(RTRIM(date_of_birth)) AS date_of_birth,
    LTRIM(RTRIM(blood_group)) AS blood_group,
    LTRIM(RTRIM(city)) AS city,
    LTRIM(RTRIM(contact_number)) AS contact_number,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.patient;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.patient;

SELECT COUNT(*) AS Silver_Count
FROM silver.patient;
GO


select* from bronze.patient;



TRUNCATE TABLE silver.patient_diagnostic;
GO

INSERT INTO silver.patient_diagnostic
(
    patient_diagnostic_id,
    test_date,
    result_status,
    admission_id,
    test_id,
    doctor_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    patient_diagnostic_id,
    LTRIM(RTRIM(test_date)) AS test_date,
    LTRIM(RTRIM(result_status)) AS result_status,
    admission_id,
    test_id,
    doctor_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.patient_diagnostic;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.patient_diagnostic;

SELECT COUNT(*) AS Silver_Count
FROM silver.patient_diagnostic;
GO



TRUNCATE TABLE silver.patient_insurance;
GO

INSERT INTO silver.patient_insurance
(
    patient_insurance_id,
    policy_number,
    coverage_percentage,
    policy_start_date,
    policy_end_date,
    patient_id,
    insurance_provider_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    patient_insurance_id,
    LTRIM(RTRIM(policy_number)) AS policy_number,
    coverage_percentage,
    LTRIM(RTRIM(policy_start_date)) AS policy_start_date,
    LTRIM(RTRIM(policy_end_date)) AS policy_end_date,
    patient_id,
    insurance_provider_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.patient_insurance;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.patient_insurance;

SELECT COUNT(*) AS Silver_Count
FROM silver.patient_insurance;
GO

select * from silver.patient_insurance;


TRUNCATE TABLE silver.prescription;
GO

INSERT INTO silver.prescription
(
    prescription_id,
    dosage,
    frequency,
    duration_days,
    admission_id,
    drug_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    prescription_id,
    LTRIM(RTRIM(dosage)) AS dosage,
    LTRIM(RTRIM(frequency)) AS frequency,
    duration_days,
    admission_id,
    drug_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.prescription;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.prescription;

SELECT COUNT(*) AS Silver_Count
FROM silver.prescription;
GO

select * from silver.prescription;



TRUNCATE TABLE silver.staff_assignment;
GO

INSERT INTO silver.staff_assignment
(
    assignment_id,
    employee_id,
    ward_id,
    shift,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    assignment_id,
    employee_id,
    ward_id,
    LTRIM(RTRIM(shift)) AS shift,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.staff_assignment;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.staff_assignment;

SELECT COUNT(*) AS Silver_Count
FROM silver.staff_assignment;
GO



TRUNCATE TABLE silver.ward;
GO

INSERT INTO silver.ward
(
    ward_id,
    ward_name,
    ward_type,
    total_beds,
    department_id,
    batch_id,
    load_datetime,
    source_file_name,
    dwh_create_date
)
SELECT
    ward_id,
    LTRIM(RTRIM(ward_name)) AS ward_name,
    LTRIM(RTRIM(ward_type)) AS ward_type,
    total_beds,
    department_id,
    batch_id,
    load_datetime,
    LTRIM(RTRIM(source_file_name)) AS source_file_name,
    GETDATE() AS dwh_create_date
FROM bronze.ward;
GO

SELECT COUNT(*) AS Bronze_Count
FROM bronze.ward;

SELECT COUNT(*) AS Silver_Count
FROM silver.ward;
GO


