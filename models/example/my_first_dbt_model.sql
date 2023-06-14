-- {{ config(materialized='table') }}

-- with wtt_customerassetsreading as (
--     select *
--     from airbytepoc.wtt_customerassetsreading
--     limit 3
-- )

-- select *
-- from wtt_customerassetsreading

{{ config(materialized='table') }}

with wtt_customerassetsreading as (
    select 
        value,
        id,
        sort,
        readingdatetime,
        assetid,
        _airbyte_ab_id,
        _airbyte_emitted_at,
        _airbyte_normalized_at,
        _airbyte_wtt_customerassetsreading_hashid
    from airbyte.wtt_customerassetsreading
    limit 3
)

select *
from wtt_customerassetsreading