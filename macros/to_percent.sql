{% macro to_percent(col_1, col_2) %}

concat(
        round((({{col_1}} - {{col_2}}) / {{col_2}}) * 100, 2),
        '%'
    )

{% endmacro %}