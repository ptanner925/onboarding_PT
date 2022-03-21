{% docs fact_contract_description %}

Fact Contracts helps answer questions related to property leasing. The table holds foreign keys to the related dimension tables and provides the ability to create calculated metrics within Scion Intelligence and SQL queries.

The granularity is one record per Lease Interval ID. It is the same granularity as Dim Contracts and also shares the same source views as Dim Contracts, fc_lease_occupancy_dates and fc_lease_applications.

Calculated Metrics Example
Sum of Beds Leased: The sum of the beds that have been leased. This metric is best summarized across property, date, and/or floorplan.

{% enddocs %}