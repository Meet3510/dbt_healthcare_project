with bronze_conditions as (
    select * from {{source('raw_data', 'bronze_conditions') }}
),

stg_conditions as (
    select 
    startdate as conditions_startdate,
    stopdate as conditions_stopdate,
    patient as conditions_patient_id,
    encounter as conditions_encounter_id,   
    description as conditions_description,
    from
    bronze_conditions
)
select * from stg_conditions