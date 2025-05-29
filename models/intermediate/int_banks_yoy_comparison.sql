with banks_2023 as (
    select 
        [Banks],
        -- Clean and convert to numeric fields (removed , handling)
        CAST(REPLACE([Total Asset], ',', '') AS FLOAT) as total_asset_2023,
        CAST(REPLACE([Paid-up Capital], ',', '') AS FLOAT) as paid_up_capital_2023,
        CAST(REPLACE([Total Capital], ',', '') AS FLOAT) as total_capital_2023
    from {{ ref('stg_bank_2022_23') }}
),

banks_2024 as (
    select 
        [Banks],
        -- Clean and convert numeric fields (removed , handling)
        CAST(REPLACE([Total Asset], ',', '') AS FLOAT) as total_asset_2024,
        CAST(REPLACE([Paid-up Capital], ',', '') AS FLOAT) as paid_up_capital_2024,
        CAST(REPLACE([Total Capital], ',', '') AS FLOAT) as total_capital_2024
    from {{ ref('stg_bank_2023_24') }}
)
select 
    b2023.[Banks],
    b2023.total_asset_2023,
    b2024.total_asset_2024,
    b2023.paid_up_capital_2023,
    b2024.paid_up_capital_2024,
    b2023.total_capital_2023,
    b2024.total_capital_2024
from banks_2023 b2023
join banks_2024 b2024 on b2023.[Banks] = b2024.[Banks]