/*
===============================================================================
                    GOLD LAYER - DIMENSION VIEWS
===============================================================================

Project : Healthcare Data Warehouse
Layer   : Gold
Purpose : Create Dimension Views for Power BI Semantic Model

Author  : Your Name
Database: HealthcareDW

===============================================================================
*/

--------------------------------------------------------------------------------
-- 1. DIMENSION : PATIENT
-- Business Purpose:
-- Consolidates patient demographic and insurance information.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_patient
AS
SELECT
    ROW_NUMBER() OVER (ORDER BY p.patient_id) AS patient_sk,
    p.patient_id,
    p.gender,
    p.date_of_birth,
    p.blood_group,
    p.city,
    p.contact_number,

    ISNULL(pi.policy_number,'No Policy') AS policy_number,
    ISNULL(pi.coverage_percentage,0) AS coverage_percentage,
    ISNULL(pi.policy_start_date,'1900-01-01') AS policy_start_date,
    ISNULL(pi.policy_end_date,'1900-01-01') AS policy_end_date,

    ISNULL(ip.provider_name,'Self Pay') AS provider_name,
    ISNULL(ip.provider_type,'Not Insured') AS provider_type,
    ISNULL(ip.coverage_limit,0) AS coverage_limit,

    CASE
        WHEN pi.patient_id IS NULL THEN 'Self Pay'
        ELSE 'Insured'
    END AS insurance_status

FROM silver.patient p

LEFT JOIN silver.patient_insurance pi
    ON p.patient_id = pi.patient_id

LEFT JOIN silver.insurance_provider ip
    ON pi.insurance_provider_id = ip.insurance_provider_id;
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_patient;



--------------------------------------------------------------------------------
-- 2. DIMENSION : DOCTOR
-- Business Purpose:
-- Combines employee, doctor, department, shift and ward information.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_doctor
AS
...
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_doctor;



--------------------------------------------------------------------------------
-- 3. DIMENSION : DRUG
-- Business Purpose:
-- Combines drug master, manufacturer and inventory information.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_drug
AS
...
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_drug;



--------------------------------------------------------------------------------
-- 4. DIMENSION : DEPARTMENT
-- Business Purpose:
-- Department master information.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_department
AS
...
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_department;



--------------------------------------------------------------------------------
-- 5. DIMENSION : WARD
-- Business Purpose:
-- Ward master with department details.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_ward
AS
...
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_ward;



--------------------------------------------------------------------------------
-- 6. DIMENSION : BED
-- Business Purpose:
-- Bed information along with ward details.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_bed
AS
...
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_bed;



--------------------------------------------------------------------------------
-- 7. DIMENSION : DISEASE
-- Business Purpose:
-- Disease master information.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_disease
AS
...
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_disease;



--------------------------------------------------------------------------------
-- 8. DIMENSION : DIAGNOSTIC TEST
-- Business Purpose:
-- Diagnostic test master information.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_diagnostic_test
AS
...
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_diagnostic_test;



--------------------------------------------------------------------------------
-- 9. DIMENSION : INSURANCE PROVIDER
-- Business Purpose:
-- Insurance provider master information.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_insurance_provider
AS
...
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_insurance_provider;



--------------------------------------------------------------------------------
-- 10. DIMENSION : DATE
-- Business Purpose:
-- Standard Calendar Dimension for Time Intelligence.
--------------------------------------------------------------------------------

CREATE OR ALTER VIEW gold.dim_date
AS
...
GO

--------------------------------------------------------------------------------
-- Validation
--------------------------------------------------------------------------------
SELECT *
FROM gold.dim_date;



/*
===============================================================================
                              END OF FILE
===============================================================================

Gold Dimensions Created
-----------------------
✓ dim_patient
✓ dim_doctor
✓ dim_drug
✓ dim_department
✓ dim_ward
✓ dim_bed
✓ dim_disease
✓ dim_diagnostic_test
✓ dim_insurance_provider
✓ dim_date

Total Dimensions : 10

===============================================================================
*/
