FreeRADIUS Puppet module
========================

[![Puppet Forge Version](http://img.shields.io/puppetforge/v/raphink/freeradius.svg)](https://forge.puppetlabs.com/raphink/freeradius)
[![Puppet Forge Downloads](http://img.shields.io/puppetforge/dt/raphink/freeradius.svg)](https://forge.puppetlabs.com/raphink/freeradius)
[![Build Status](https://img.shields.io/travis/raphink/puppet-freeradius/master.svg)](https://travis-ci.org/raphink/puppet-freeradius)


## Usage

### Simple usage

```puppet
include freeradius
```

### Add a module

```puppet
class { 'freeradius': }

freeradius::mod { 'perl':
  ensure  => present,
  package => 'freeradius-perl',
  content => 'perl {
    filename = ${modconfdir}/${.:instance}/auth.pl
  }
  ',
}

file { '/etc/raddb/mods-config/perl/auth.pl':
  ensure  => file,
  require => Package['freeradius-perl'],
  notify  => Class['freeradius::service'],
}
```
