{{ config(materialized='table') }}

WITH banks AS (
    SELECT DISTINCT bank_name FROM {{ ref('stg_bank_2022_23') }}
    UNION
    SELECT DISTINCT bank_name FROM {{ ref('stg_bank_2023_24') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['bank_name']) }} AS bank_key,
    bank_name
FROM banks

