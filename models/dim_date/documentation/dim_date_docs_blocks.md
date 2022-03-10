# This file collects all the Docs Blocks used for adding detailed information to dim_date_schema.yml.

{% docs dim_date_description %}

The Dim Dates table provides information based on a specified date value. Information includes season, year, month, and day. There is a row for each date from 2001-09-16 through 2029-12-29. There are also two "Unknown" record rows that have a date value of 1900-01-01 and 2100-01-01.

There is one row per date. The Date column is the primary key on the table and can be used to uniquely identify each record.

{% enddocs %}