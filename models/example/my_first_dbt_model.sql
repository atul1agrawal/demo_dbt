/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (
    select 1 as id, 'John' as name, 'Engineer' as occupation
    union all
    select null as id, 'Jane' as name, 'Manager' as occupation
    -- Add more dummy data rows below
    union all
    select 2 as id, 'Bob' as name, 'Designer' as occupation
    union all
    select 3 as id, 'Alice' as name, 'Developer' as occupation
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
