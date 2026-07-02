{{ 
    config(materialized ='table')
}}
with payer as (
    select 
        payer_id as "Payer ID",
        payer_name as "Payer Name",
        payer_address as "Payer Address",
        payer_city as "City",
        payer_amount_covered as "Amount Covered",
        payer_amount_uncovered as "Amount Uncovered",
        payer_revenue as "Revenue",
        payer_covered_encounters as "Covered Encounters",
        payer_uncovered_encounters as "Uncovered Encounters" 
    from {{ ref('stg_payers')}}
)

select * from payer