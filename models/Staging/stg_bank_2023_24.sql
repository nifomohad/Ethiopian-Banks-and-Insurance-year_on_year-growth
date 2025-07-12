
SELECT
    S_N::INT AS sn,
    BANKS AS bank_name,
    '2023/24' AS fiscal_year,
    REPLACE(TOTAL_ASSET, ',', '')::NUMBER AS total_asset,
    REPLACE(TOTAL_ASSET_USD, ',', '')::NUMBER AS total_asset_usd,
    REPLACE(PAID_UP_CAPITAL, ',', '')::NUMBER AS paid_up_capital,
    REPLACE(PAID_UP_CAPITAL_USD, ',', '')::NUMBER AS paid_up_capital_usd,
    REPLACE(TOTAL_CAPITAL, ',', '')::NUMBER AS total_capital,
    REPLACE(TOTAL_CAPITAL_USD, ',', '')::NUMBER AS total_capital_usd,
    REPLACE(PROFIT_BEFORE_TAX, ',', '')::NUMBER AS profit_before_tax,
    REPLACE(PROFIT_BEFORE_TAX_USD, ',', '')::NUMBER AS profit_before_tax_usd,

    -- Use comprehensive_income as net_income for 23/24 data
    REPLACE(COMPREHENSIVE_INCOME_FOR_YEAR, ',', '')::NUMBER AS net_income,
    REPLACE(COMPREHENSIVE_INCOME_FOR_YEAR_USD, ',', '')::NUMBER AS net_income_usd,

    REPLACE(PROFIT_FOR_THE_YEAR, ',', '')::NUMBER AS profit_for_the_year,
    REPLACE(PROFIT_FOR_THE_YEAR_USD, ',', '')::NUMBER AS profit_for_the_year_usd,

    {{ convert_percent_to_decimal('s.ROE') }} AS roe,
    {{ convert_percent_to_decimal('s.EPS') }} AS eps,
    {{ convert_percent_to_decimal('s.ROA') }} AS roa
FROM {{ source('DBT_REMODEL', 'Bank_2023_24') }} AS s

