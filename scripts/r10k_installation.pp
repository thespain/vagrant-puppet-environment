## The setting below accepts what will become the default
Package {  allow_virtual => true, }

file { '/var/cache/r10k':
  ensure            => directory,
  owner             => 'puppet',
  group             => 'puppet',
}

class { 'r10k':
  manage_modulepath => false,
  purgedirs         => ["${::settings::confdir}/environments"],
  sources           => {
    'gitlab' => {
      'remote'  => 'git@code.westga.edu:puppet-config/puppet-environments.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    }
  },
  
  require           => File['/var/cache/r10k'],
}

