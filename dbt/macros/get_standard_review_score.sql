{#
    This macro adjusts the score based on the publication.  
#}
{% macro get_standard_review_score(publication, score) -%}

    case when {{ publication }} != "CNET" then {{ score }} * 2 else {{ score }} end

{%- endmacro %}
