select
    Insurances,
    total_asset_2023,
    total_asset_2024,
    total_asset_2024 - total_asset_2023 as diff_total_asset,
    concat(
        round(((total_asset_2024 - total_asset_2023) / total_asset_2023) * 100, 2),
        '%'
    ) as percent_total_asset

    from {{ ref('int_insurances_yoy_comparison') }}
    where total_asset_2023 is not null