with bronze_providers as (
    select * from {{ source('raw_data', 'bronze_providers') }}
),

stg_providers as (
    select 
        ID AS Provider_ID,
        ORGANIZATION AS Organization_ID,
        NAME AS Provider_Name,
        GENDER AS Provider_Gender,
        SPECIALITY AS Provider_Specialty,
        ADDRESS AS Provider_Address,
        CITY AS Provider_City,
        STATE AS Provider_State,
        ZIP AS Provider_Zip,
        LAT AS Provider_Latitude,
        LON AS Provider_Longitude,
        UTILIZATION AS Provider_Utilization
        FROM bronze_providers
)

SELECT * FROM stg_providers