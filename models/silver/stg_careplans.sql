with bronze_careplans as(
    select * from {{ source('raw_data', 'bronze_Careplans') }}
),

stg_careplans as(
    select  
    id as Careplans_ID,
    startdate as careplan_start_date,
    stopdate as careplan_stop_date,
    patient as patient_id,
    encounter as encounters_id,
    code as careplan_code,
    description as careplan_description,
    reasoncode as careplan_reasoncode,
    reasondescription as careplan_reason_description    
    from 
    bronze_careplans
),

stg_duplication as (
    select * from 
    stg_careplans 
    qualify row_number() over(partition by Careplans_ID order by careplan_start_date desc) = 1
)

select * from stg_duplication