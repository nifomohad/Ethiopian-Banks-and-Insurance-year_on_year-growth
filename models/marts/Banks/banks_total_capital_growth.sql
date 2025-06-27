

select
    banks,
    total_capital_in_USD_2023,
    total_capital_in_USD_2024,
    total_capital_in_USD_2024 - total_capital_in_USD_2023 as diff_total_capital,
    {{to_percent('total_capital_in_USD_2024','total_capital_in_USD_2023')}} as percent_total_capital,
    {{decline_range('percent_total_capital')}} as capital_decline_range



from {{ ref('int_banks_yoy_comparison') }}
where paid_up_capital_2023 is not null




    -- concat(
    --     round(((total_capital_2024-total_capital_2023) / total_asset_2023) * 100, 2),
    --     '%'
    -- ) as percent_total_capital
