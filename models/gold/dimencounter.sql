with encounter as (
    select 
        encounters_id as "Encounter ID",
        encounters_start_date as "Encounter Start Date",
        encounters_end_date as "Encounter End Date",
        encounters_class as "Encounter Class",
        encounters_description as "Encounter Descriprition",
        total_claim_cost as "Total Claim Cost",
        payer_coverage as "Payer Coverage",
        patient_id as "Patient ID",
        organization_id as "Organization ID",
        provider_id as "Provider ID",
        payer_id as "Payer ID"
    from {{ ref('stg_encounters')}}
)

select * from encounter

