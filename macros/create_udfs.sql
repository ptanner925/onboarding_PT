{# See related post: https://discourse.getdbt.com/t/using-dbt-to-manage-user-defined-functions/18 #}

{% macro create_udfs() %}

create schema if not exists {{target.schema}};

{{create_udf_get_season_from_date()}};
{{create_udf_get_season_week()}};
{{create_udf_get_date_key()}};

{% endmacro %}