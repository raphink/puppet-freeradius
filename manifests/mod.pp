define freeradius::mod (
  $ensure = 'present',
  $content = undef,
  $package = undef,
) {
  if ($ensure == 'present') {
    validate_re($content, '\S+', 'Must pass content to freeradius::mod')
    $file_ensure = 'file'
  } else {
    $file_ensure = $ensure
  }

  file { "/etc/raddb/mods-enabled/${name}":
    ensure  => $file_ensure,
    owner   => 'root',
    group   => 'radiusd',
    mode    => '0640',
    content => $content,
  }

  if $package {
    package { $package:
      ensure => present,
      before => File["/etc/raddb/mods-enabled/${name}"],
    }
  }

  Class['freeradius::install'] ->
  Freeradius::Mod[$title] ~>
  Class['freeradius::service']
}
