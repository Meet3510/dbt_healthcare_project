{{ 
    config(materialized ='table')
}}
with condition as (
    select 
        conditions_patient_id as "Patient ID",
        conditions_encounter_id as "Encounter ID",
        conditions_description as "Description",
        conditions_startdate as "Start Date",
        conditions_stopdate as "Stop Date"
    from {{ ref('stg_conditions')}}
)

select * from condition
