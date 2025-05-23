with Insurance_2023 as (
    select 
        Insurances,
        -- Clean and convert to numeric fields (remove comma)
        CAST(REPLACE([Total Asset], ',', '') AS FLOAT) as total_asset_2023,
        CAST(REPLACE([Paid-up Capital], ',', '') AS FLOAT) as paid_up_capital_2023,
        CAST(REPLACE([Total Capital], ',', '') AS FLOAT) as total_capital_2023
    from {{ ref('stg_insurance_2022_23') }}
),

Insurance_2024 as (
    select 
        Insurances,
        -- Clean and convert to numeric fields (remove comma)
        CAST(REPLACE([Total Asset], ',', '') AS FLOAT) as total_asset_2024,
        CAST(REPLACE([Paid-up Capital], ',', '') AS FLOAT) as paid_up_capital_2024,
        CAST(REPLACE([Total Capital], ',', '') AS FLOAT) as total_capital_2024
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
