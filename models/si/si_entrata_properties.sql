select
  *
from {{ source('si', 'entrata_properties') }}