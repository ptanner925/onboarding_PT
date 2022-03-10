select
  *
from {{ source('entrata', 'application_statuses') }}