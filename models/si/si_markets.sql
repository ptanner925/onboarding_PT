select
  *
from {{ source('si', 'markets') }}