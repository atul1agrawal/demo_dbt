{% macro ctx() %}
  SELECT CURRENT_TIMESTAMP() AS timestamp
{% endmacro %}