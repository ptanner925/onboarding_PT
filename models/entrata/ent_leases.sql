select
  *
from {{ source('entrata', 'leases') }}