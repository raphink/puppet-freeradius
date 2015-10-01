# ## Manage a module
# ```puppet
class { 'freeradius': }

freeradius::mod { 'perl':
  ensure  => present,
  package => 'freeradius-perl',
  content => "perl {
    filename = \${modconfdir}/\${.:instance}/auth.pl
  }\n",
}

file { '/etc/raddb/mods-config/perl/auth.pl':
  ensure  => file,
  require => Package['freeradius-perl'],
  notify  => Class['freeradius::service'],
}
# ```
