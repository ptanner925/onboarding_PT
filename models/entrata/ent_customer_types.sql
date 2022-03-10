select
  *
from {{ source('entrata', 'customer_types') }}