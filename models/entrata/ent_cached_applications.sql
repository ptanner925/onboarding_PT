select
  *
from {{ source('entrata', 'cached_applications') }}