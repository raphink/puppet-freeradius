class freeradius::service {
  service { 'radiusd':
    ensure => running,
    enable => true,
  }
}
