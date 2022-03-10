select
  *
from {{ source('entrata', 'customers') }}