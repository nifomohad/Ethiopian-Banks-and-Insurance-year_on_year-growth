SELECT
    S_N::INT AS sn,
    BANK_NAME AS bank_name,
    '2022/23' AS fiscal_year,
    REPLACE(TOTAL_ASSET, ',', '')::NUMBER AS total_asset,
    REPLACE(TOTAL_ASSET_USD, ',', '')::NUMBER AS total_asset_usd,
    REPLACE(PAID_UP_CAPITAL, ',', '')::NUMBER AS paid_up_capital,
    REPLACE(PAID_UP_CAPITAL_USD, ',', '')::NUMBER AS paid_up_capital_usd,
    REPLACE(TOTAL_CAPITAL, ',', '')::NUMBER AS total_capital,
    REPLACE(TOTAL_CAPITAL_USD, ',', '')::NUMBER AS total_capital_usd,
    REPLACE(PROFIT_BEFORE_TAX, ',', '')::NUMBER AS profit_before_tax,
    REPLACE(PROFIT_BEFORE_TAX_USD, ',', '')::NUMBER AS profit_before_tax_usd,

    -- Use net_income from 22/23 data
    REPLACE(NET_INCOME, ',', '')::NUMBER AS net_income,
    REPLACE(NET_INCOME_USD, ',', '')::NUMBER AS net_income_usd,

    REPLACE(PROFIT_FOR_THE_YEAR_000, ',', '')::NUMBER AS profit_for_the_year,
    REPLACE(PROFIT_FOR_THE_YEAR_USD, ',', '')::NUMBER AS profit_for_the_year_usd,
    {{ convert_percent_to_decimal('s.ROE') }} AS roe,
    {{ convert_percent_to_decimal('s.EPS') }} AS eps,
    {{ convert_percent_to_decimal('s.ROA') }} AS roa

FROM {{ source('DBT_REMODEL', 'Bank_2022_23') }} AS s

