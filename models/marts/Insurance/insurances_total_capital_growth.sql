select
    Insurances,
    total_capital_2023,
    total_capital_2024,
    total_capital_2024 - total_capital_2023 as diff_total_capital,
    {{ to_percent('total_capital_2024', 'total_capital_2023') }} as percent_total_capital
    -- concat(
    --     round(((total_capital_2024-total_capital_2023) / total_asset_2023) * 100, 2),
    --     '%'
    -- ) as percent_total_capital
from {{ ref('int_insurances_yoy_comparison') }}
where paid_up_capital_2023 is not null