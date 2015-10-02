class freeradius {
  anchor { 'freeradius::begin': } ->
  class { 'freeradius::install': } ->
  class { 'freeradius::service': } ->
  anchor { 'freeradius::end': }
}
