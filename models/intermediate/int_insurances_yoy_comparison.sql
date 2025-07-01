with Insurance_2023 as (
    select 
        Insurances,
        {{TO_FLOAT('Total_Asset')}} as total_asset_2023,
        {{TO_FLOAT('Paid_up_Capital')}} as paid_up_capital_2023,
        {{TO_FLOAT('Total_Capital')}} as total_capital_2023
        -- --
        -- CAST(REPLACE(CAST(Total_Asset AS STRING), ',', '') AS FLOAT) as total_asset_2023,
        -- CAST(REPLACE(CAST(Paid_up_Capital AS STRING), ',', '') AS FLOAT) as paid_up_capital_2023,
        -- CAST(REPLACE(CAST(Total_Capital AS STRING), ',', '') AS FLOAT) as total_capital_2023
    from {{ ref('stg_insurance_2022_23') }}
),

Insurance_2024 as (
    select 
        Insurances,
        {{TO_FLOAT('Total_Asset') }}as total_asset_2024,
        {{TO_FLOAT('Paid_up_Capital')}} as paid_up_capital_2024,
        {{TO_FLOAT('Total_Capital')}} as total_capital_2024


        -- CAST(REPLACE(CAST(Total_Asset AS STRING), ',', '') AS FLOAT) as total_asset_2024,
        -- CAST(REPLACE(CAST(Paid_up_Capital AS STRING), ',', '') AS FLOAT) as paid_up_capital_2024,
        -- CAST(REPLACE(CAST(Total_Capital AS STRING), ',', '') AS FLOAT) as total_capital_2024
    from {{ ref('stg_insurance_2023_24') }}
)

select 
    i2023.Insurances,
    i2023.total_asset_2023,
    i2024.total_asset_2024,
    i2023.paid_up_capital_2023,
    i2024.paid_up_capital_2024,
    i2023.total_capital_2023,
    i2024.total_capital_2024
from Insurance_2023 i2023
join Insurance_2024 i2024 
    on i2023.Insurances = i2024.Insurances
