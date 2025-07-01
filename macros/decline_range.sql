{% macro decline_range(col) %}
 CASE
        WHEN {{col}} >=50 then 'Severe Decline'
        WHEN {{col}} <=10 then 'Mild Decline'
        WHEN {{col}} >=10 and {{col}} <50 then 'High Decline'
        ELSE 'No Decline'
    END 

{% endmacro %}