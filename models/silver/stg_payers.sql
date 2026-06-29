with bronze_payers as(
    select * from {{source('raw_data', 'bronze_payers') }}
),

stg_payers as (
    select
    id as payer_id,
    name as payer_name,
    address as payer_address,
    city as payer_city,
    state_headquartered as payer_state_headquarters,
    amount_covered as payer_amount_covered,
    amount_uncovered as payer_amount_uncovered,
    revenue as payer_revenue,
    covered_encounters as payer_covered_encounters,
    uncovered_encounters as payer_uncovered_encounters
    from 
    bronze_payers
)

select * from stg_payers