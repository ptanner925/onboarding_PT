select
  *
from {{ source('entrata', 'lease_status_types') }}