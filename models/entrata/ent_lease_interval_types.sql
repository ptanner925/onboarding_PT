select
  *
from {{ source('entrata', 'lease_interval_types') }}