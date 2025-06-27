select
    Banks,
    paid_up_capital_2023,
    paid_up_capital_2024,
    paid_up_capital_2024 - paid_up_capital_2023 as diff_paid_up_capital,
    {{to_percent('paid_up_capital_2024','paid_up_capital_2023')}} as captial_change_in_percent,
    {{decline_range('captial_change_in_percent')}} as capital_decline_range

 
    from {{ ref('int_banks_yoy_comparison') }}
    where paid_up_capital_2023 is not null
    



     -- round(((paid_up_capital_2024 - paid_up_capital_2023) / paid_up_capital_2023) * 100, 2) as captial_change_in_percent,
    
    
    -- CASE
    --     WHEN captial_change_in_percent >=50 then 'Severe Decline'
    --     WHEN captial_change_in_percent <=10 then 'Mild Decline'
    --     WHEN captial_change_in_percent >=10 and captial_change_in_percent <50 then 'High Decline'
    --     ELSE 'No Decline'
    -- END as capital_decline_range
  