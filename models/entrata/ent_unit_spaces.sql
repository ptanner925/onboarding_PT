select
  *
from {{ source('entrata', 'unit_spaces') }}