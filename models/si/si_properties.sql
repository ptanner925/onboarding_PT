select
  *
from {{ source('si', 'properties') }}