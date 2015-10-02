# ### Manage a module using a template file
# ```puppet
class { 'freeradius': }


freeradius::mod { 'sql':
  ensure  => present,
  package => 'freeradius-mysql',
  content => template('module/radius_sql.erb'),
}

# ```
