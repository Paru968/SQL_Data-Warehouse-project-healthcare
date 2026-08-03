/* ============================================================================
   SILVER LAYER - DDL
   Schema-renamed from bronze.* to silver.* (structure otherwise unchanged
   from the original Bronze DDL).
   Business columns are an exact 1:1 mirror of each CSV: same names, same
   order, no additions, no invented keys or relationships. Only the 3 ETL
   metadata columns are appended: batch_id, load_datetime, source_file_name.
   ============================================================================ */
USE HospitalDWH;
GO

IF OBJECT_ID('silver.admission') IS NOT NULL DROP TABLE silver.admission;
CREATE TABLE silver.admission (
    admission_id INT,
    admission_date VARCHAR(20),
    discharge_date VARCHAR(20),
    admission_type VARCHAR(20),
    admission_status VARCHAR(20),
    patient_id INT,
    department_id INT,
    ward_id INT,
    bed_id INT,
    disease_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.bed') IS NOT NULL DROP TABLE silver.bed;
CREATE TABLE silver.bed (
    bed_id INT,
    bed_number VARCHAR(20),
    bed_status VARCHAR(20),
    ward_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.billing') IS NOT NULL DROP TABLE silver.billing;
CREATE TABLE silver.billing (
    bill_id INT,
    bill_date VARCHAR(20),
    total_amount INT,
    insurance_covered_amount FLOAT,
    patient_payable_amount FLOAT,
    payment_status VARCHAR(20),
    payment_mode VARCHAR(20),
    admission_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.billing_detail') IS NOT NULL DROP TABLE silver.billing_detail;
CREATE TABLE silver.billing_detail (
    billing_detail_id INT,
    charge_type VARCHAR(20),
    reference_id FLOAT,
    amount INT,
    bill_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.department') IS NOT NULL DROP TABLE silver.department;
CREATE TABLE silver.department (
    department_id INT,
    department_name VARCHAR(27),
    department_type VARCHAR(20),
    floor_number INT,
    status VARCHAR(20),
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.diagnostic_test') IS NOT NULL DROP TABLE silver.diagnostic_test;
CREATE TABLE silver.diagnostic_test (
    test_id INT,
    test_name VARCHAR(30),
    test_category VARCHAR(20),
    standard_cost INT,
    department_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.disease') IS NOT NULL DROP TABLE silver.disease;
CREATE TABLE silver.disease (
    disease_id INT,
    disease_name VARCHAR(55),
    disease_category VARCHAR(23),
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

DROP TABLE IF EXISTS silver.doctor;
GO

IF OBJECT_ID('silver.doctor') IS NOT NULL DROP TABLE silver.doctor;

CREATE TABLE silver.doctor
(
    doctor_id INT,
    employee_id INT,
    specialization VARCHAR(100),
    qualification VARCHAR(50),
    experience_years INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL,
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.drug') IS NOT NULL DROP TABLE silver.drug;
CREATE TABLE silver.drug
(
    drug_id INT,
    drug_name VARCHAR(100),
    brand_name VARCHAR(200),
    drug_category VARCHAR(100),
    unit_cost DECIMAL(10,2),
    manufacturer_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL,
    source_file_name VARCHAR(255) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
go


IF OBJECT_ID('silver.drug_inventory') IS NOT NULL DROP TABLE silver.drug_inventory;
CREATE TABLE silver.drug_inventory (
    inventory_id INT,
    current_stock INT,
    reorder_level INT,
    inventory_status VARCHAR(20),
    last_restock_date VARCHAR(20),
    drug_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.drug_manufacturer') IS NOT NULL DROP TABLE silver.drug_manufacturer;
CREATE TABLE silver.drug_manufacturer (
    manufacturer_id INT,
    manufacturer_name VARCHAR(52),
    country VARCHAR(21),
    reliability_rating FLOAT,
    contract_status VARCHAR(20),
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.employee') IS NOT NULL DROP TABLE silver.employee;
CREATE TABLE silver.employee (
    employee_id INT,
    employee_name VARCHAR(36),
    gender VARCHAR(20),
    role VARCHAR(20),
    employment_type VARCHAR(20),
    date_of_joining VARCHAR(20),
    department_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.insurance_provider') IS NOT NULL DROP TABLE silver.insurance_provider;
CREATE TABLE silver.insurance_provider (
    insurance_provider_id INT,
    provider_name VARCHAR(66),
    provider_type VARCHAR(20),
    contact_details VARCHAR(23),
    coverage_limit INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.patient') IS NOT NULL DROP TABLE silver.patient;
CREATE TABLE silver.patient (
    patient_id INT,
    gender VARCHAR(20),
    date_of_birth VARCHAR(20),
    blood_group VARCHAR(20),
    city VARCHAR(36),
    contact_number VARCHAR(33),
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.patient_diagnostic') IS NOT NULL DROP TABLE silver.patient_diagnostic;
CREATE TABLE silver.patient_diagnostic (
    patient_diagnostic_id INT,
    test_date VARCHAR(20),
    result_status VARCHAR(20),
    admission_id INT,
    test_id INT,
    doctor_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.patient_insurance') IS NOT NULL DROP TABLE silver.patient_insurance;
CREATE TABLE silver.patient_insurance (
    patient_insurance_id INT,
    policy_number VARCHAR(21),
    coverage_percentage INT,
    policy_start_date VARCHAR(20),
    policy_end_date VARCHAR(20),
    patient_id INT,
    insurance_provider_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.prescription') IS NOT NULL DROP TABLE silver.prescription;
CREATE TABLE silver.prescription (
    prescription_id INT,
    dosage VARCHAR(20),
    frequency VARCHAR(22),
    duration_days INT,
    admission_id INT,
    drug_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.staff_assignment') IS NOT NULL DROP TABLE silver.staff_assignment;
CREATE TABLE silver.staff_assignment (
    assignment_id INT,
    employee_id INT,
    ward_id INT,
    shift VARCHAR(20),
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.ward') IS NOT NULL DROP TABLE silver.ward;
CREATE TABLE silver.ward (
    ward_id INT,
    ward_name VARCHAR(36),
    ward_type VARCHAR(22),
    total_beds INT,
    department_id INT,
    batch_id INT NOT NULL,
    load_datetime DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    source_file_name VARCHAR(200) NOT NULL,
    dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO
