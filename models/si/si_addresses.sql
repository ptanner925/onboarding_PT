select
  *
from {{ source('si', 'addresses') }}