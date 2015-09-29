class freeradius {
  class { 'freeradius::install': } ->
  class { 'freeradius::service': }
}
