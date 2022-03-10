select
  *
from {{ source('entrata', 'application_stages') }}