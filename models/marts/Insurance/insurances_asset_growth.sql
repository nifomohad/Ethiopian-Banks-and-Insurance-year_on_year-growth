select
    Insurances,
    total_asset_2023,
    total_asset_2024,
    total_asset_2024 - total_asset_2023 as diff_total_asset,
    {{to_percent('total_asset_2024', 'total_asset_2023')}} as percent_total_asset,
    {{decline_range('percent_total_asset')}} as asset_decline_range


    from {{ ref('int_insurances_yoy_comparison') }}
    where total_asset_2023 is not null









 
    -- concat(
    --     round(((total_asset_2024 - total_asset_2023) / total_asset_2023) * 100, 2),
    --     '%'
    -- ) as percent_total_asset   