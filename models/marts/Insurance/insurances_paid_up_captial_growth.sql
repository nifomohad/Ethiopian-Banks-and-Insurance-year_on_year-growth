select
    Insurances,
    paid_up_capital_2023,
    paid_up_capital_2024,
    paid_up_capital_2024 - paid_up_capital_2023 as diff_paid_up_capital,
    {{to_percent('paid_up_capital_2024', 'paid_up_capital_2023')}} as percent_paid_up_capital,
    {{decline_range('percent_paid_up_capital')}} as capital_decline_range



    from {{ ref('int_insurances_yoy_comparison') }}
    where paid_up_capital_2023 is not null
    


        -- concat(
    --     round(((paid_up_capital_2024 - paid_up_capital_2023) / paid_up_capital_2023) * 100, 2),
    --     '%'
    -- ) as percent_paid_up_capital