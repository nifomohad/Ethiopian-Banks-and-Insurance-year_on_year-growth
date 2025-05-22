select
    Insurances,
    paid_up_capital_2023,
    paid_up_capital_2024,
    paid_up_capital_2024 - paid_up_capital_2023 as diff_paid_up_capital,
    concat(
        round(((paid_up_capital_2024 - paid_up_capital_2023) / paid_up_capital_2023) * 100, 2),
        '%'
    ) as percent_paid_up_capital

    from {{ ref('int_insurances_yoy_comparison') }}
    where paid_up_capital_2023 is not null
    