select
  *
from {{ source('entrata', 'customer_addresses') }}