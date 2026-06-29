with bronze_organnizations as(
    select * from {{source('raw_data', 'bronze_organizations') }}
),

stg_organizations as(
    select  
    id as organizations_id,
    name as organizations_name,
    address as organizations_address,
    city as organizations_city,
    state as organizations_state,
    phone as organizations_phone,
    revenue as organizations_revenue,
    utilization as organizations_utilization
    from 
    bronze_organnizations
)

select * from stg_organizations