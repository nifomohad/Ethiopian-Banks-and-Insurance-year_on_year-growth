

WITH base_2022 AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key([ "s.bank_name", "'2022/23'" ]) }} AS bank_performance_key,
        b.bank_key,
        d.date_key,
        '2022/23' AS year,
        s.total_asset,
        s.total_asset_usd,
        s.paid_up_capital,
        s.paid_up_capital_usd,
        s.total_capital,
        s.total_capital_usd,
        s.profit_before_tax,
        s.profit_before_tax_usd,
        s.net_income,
        s.net_income_usd,
        s.profit_for_the_year AS profit_for_year,  
        s.profit_for_the_year_usd,
        s.roe,
        s.eps,
        s.roa
    FROM {{ ref('stg_bank_2022_23') }} s
    LEFT JOIN {{ ref('dim_bank') }} b ON s.bank_name = b.bank_name
    LEFT JOIN {{ ref('dim_date') }} d ON d.year = '2022/23'
),

base_2023 AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key([ "s.bank_name", "'2023/24'" ]) }} AS bank_performance_key,
        b.bank_key,
        d.date_key,
        '2023/24' AS year,
        s.total_asset,
        s.total_asset_usd,
        s.paid_up_capital,
        s.paid_up_capital_usd,
        s.total_capital,
        s.total_capital_usd,
        s.profit_before_tax,
        s.profit_before_tax_usd,
        s.net_income,
        s.net_income_usd,
        s.profit_for_the_year AS profit_for_year,
        s.profit_for_the_year_usd,
        s.roe,
        s.eps,
        s.roa
    FROM {{ ref('stg_bank_2023_24') }} s
    LEFT JOIN {{ ref('dim_bank') }} b ON s.bank_name = b.bank_name
    LEFT JOIN {{ ref('dim_date') }} d ON d.year = '2023/24'
)

SELECT * FROM base_2022
UNION ALL
SELECT * FROM base_2023
