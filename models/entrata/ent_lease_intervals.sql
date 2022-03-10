select
  *
from {{ source('entrata', 'lease_intervals') }}