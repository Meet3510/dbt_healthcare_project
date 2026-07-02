{{ 
    config(materialized ='table')
}}
with careplans as (
    select *
    from 
    {{ref('stg_careplans')}}
),

patients as (
    select *
    from {{ ref('stg_patients')}}

)

select 
        sp.patient_id as "Patient ID",
        sp.patient_dob as "Patient DOB",
        sp.patient_passport as "Passport",
        sp.patient_first_name as "Patient First Name",
        sp.patient_last_name as "Patient Last Name",
        sp.patient_race as "Patient Race",
        sp.patient_ethnicity as "Patient Ethnicity",
        case 
            when sp.patient_gender = 'M' then 'Male'
            when sp.patient_gender = 'F' then 'Female'
            else 'Unknown'
        end as "Patient Gender",
        sp.patient_city as "Patient City",
        sp.patient_state as "Patient State",
        sp.patient_healthcare_expense as "Healthcare Expense",
        sp.patient_healthcare_coverage as "Healthcare Coverage",
        cp.careplan_start_date as "Careplan Start Date",
        cp.careplan_stop_date as "Careplan End Date",
        cp.careplan_code as "Careplan Code",
        cp.careplan_description as "Careplan Description",
        cp.careplan_reasoncode as "Reason code",
        cp.careplan_reason_description as "Careplan Reason Description",
        cp.careplans_id as "Careplan ID",
        cp.encounters_id as "Encounter ID"
from patients sp 
left join 
careplans cp on sp.patient_id = cp.patient_id