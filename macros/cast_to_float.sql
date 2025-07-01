{% macro TO_FLOAT(col) %}

    CAST(REPLACE(CAST({{col}} AS STRING), ',', '') AS FLOAT)


{% endmacro %}