with bronze_encounters as (
    select * from {{source('raw_data', 'bronze_encounters') }}
),

stg_encounters as (
    select 
    id as encounters_id,
    start_date as encounters_start_date,
    stop_date as encounters_end_date,
    patient as patient_id,
    organization as organization_id,
    provider as provider_id,
    payer as payer_id,
    encounterclass as encounters_class,
    description as encounters_description,
    total_claim_cost as total_claim_cost,
    payer_coverage as payer_coverage,
    reasoncode as reason_code,
    reasondescription as reason_description,
    from
    bronze_encounters
),

stg_duplication as (
    select * from stg_encounters
    qualify row_number() over(partition by encounters_id,provider_id,payer_id order by encounters_start_date desc) = 1

)

select * from stg_duplication