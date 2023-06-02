{% macro t(value) %}
  {% if target.language == 'en' %}
    {{ value }}  -- English translation
  {% elif target.language == 'fr' %}
    {{ value }}  -- French translation
  {% elif target.language == 'es' %}
    {{ value }}  -- Spanish translation
  {% else %}
    {{ value }}  -- Default translation (fallback)
  {% endif %}
{% endmacro %}
