
SELECT
    S_N::INT AS sn,
    BANKS AS bank_name,
    REPLACE(TOTAL_ASSET, ',', '')::NUMBER AS total_asset,
    REPLACE(TOTAL_ASSET_USD, ',', '')::NUMBER AS total_asset_usd,
    REPLACE(PAID_UP_CAPITAL, ',', '')::NUMBER AS paid_up_capital,
    REPLACE(PAID_UP_CAPITAL_USD, ',', '')::NUMBER AS paid_up_capital_usd,
    REPLACE(TOTAL_CAPITAL, ',', '')::NUMBER AS total_capital,
    REPLACE(TOTAL_CAPITAL_USD, ',', '')::NUMBER AS total_capital_usd,
    REPLACE(PROFIT_BEFORE_TAX, ',', '')::NUMBER AS profit_before_tax,
    REPLACE(PROFIT_BEFORE_TAX_USD, ',', '')::NUMBER AS profit_before_tax_usd,
    REPLACE(COMPREHENSIVE_INCOME_FOR_YEAR, ',', '')::NUMBER AS comprehensive_income_for_year,
    REPLACE(COMPREHENSIVE_INCOME_FOR_YEAR_USD, ',', '')::NUMBER AS comprehensive_income_for_year_usd,
    REPLACE(PROFIT_FOR_THE_YEAR, ',', '')::NUMBER AS profit_for_the_year,
    REPLACE(PROFIT_FOR_THE_YEAR_USD, ',', '')::NUMBER AS profit_for_the_year_usd,
    REPLACE(ROE, '%', '')::FLOAT / 100 AS roe,
    REPLACE(EPS, '%', '')::FLOAT / 100 AS eps,
    REPLACE(ROA, '%', '')::FLOAT / 100 AS roa,
    '2023/24' AS fiscal_year
FROM {{ source('DBT_REMODEL', 'Bank_2023_24') }}