with bronze_patients as (
    select * from {{ source('raw_data', 'bronze_patients') }}
),

stg_patients as (
    select 
        id as Patient_ID,
        birthdate as Patient_DOB,
        deathdate as Patient_DOD,
        ssn as Patient_SSN,
        drivers as Patient_Driver_License,
        passport as Patient_Passport,
        prefix as Patient_Prefix,
        first as Patient_First_Name,
        last as Patient_Last_Name,
        suffix as Patient_Suffix,
        Maiden as Patient_Maiden,
        race as Patient_Race,
        ethnicity as Patient_Ethnicity,
        Gender as Patient_Gender,
        Birthplace as Patient_Birth_Place,
        address as Patient_Address,
        city as Patient_City,
        State as Patient_State,
        healthcare_expenses as Patient_Healthcare_Expense,
        healthcare_coverage as Patient_Healthcare_Coverage
    from bronze_patients
),

stg_deduplication as (
    select *
    from stg_patients
    qualify row_number() over(partition by Patient_ID ORDER BY Patient_DOB desc )=1
)

select * from stg_deduplication 
