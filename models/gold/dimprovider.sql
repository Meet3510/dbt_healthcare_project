with providers as (
    select  
    *
    from 
    {{ ref('stg_providers')}}
),

organizations as (
    select 
    *
     from
    {{ ref('stg_organizations')}}
)

select  
    sp.provider_id as "Provider ID",
    provider_name as "Provider Name",
    case 
        when provider_gender ='M' then 'Male'
        when provider_gender = 'F' then 'Female'
        else 'Unknown'
    end as "Provider Gender",
    sp.provider_specialty as "Provider Specialty",
    sp.provider_address as "Provider Address",
    sp.provider_city as "Provider City",
    sp.provider_state as "Provider State",
    sp.provider_utilization as "Provider Utilization",
    so.organizations_id as "Organization ID",
    so.organizations_name as "Organization Name",
    so.organizations_city as "Organization City",
    so.organizations_state as "Organization State",
    so.organizations_revenue as "Organization Revenue",
    so.organizations_utilization as "Organization Utilization"
from 
providers sp 
left join organizations so on sp.Organization_id = so.organizations_id