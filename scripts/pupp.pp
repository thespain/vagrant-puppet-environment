class { '::puppet':
  pluginsync                    => true,
  runmode                       => 'none',
  dns_alt_names                 => [ 'puppet', ],
  
  agent                         => true,
  puppetmaster                  => 'pm.localdomain',

  server                        => true,
  server_ca                     => true,
  server_reports                => 'log,store,puppetdb,foreman',
  server_passenger              => true,
  server_external_nodes         => '', # since not using foreman
  server_dynamic_environments   => false,
  server_directory_environments => true,
  server_environments           => [],
  server_environments_owner     => 'puppet',
  server_environments_group     => 'puppet',
  server_envs_dir               => '/etc/puppet/environments',
  server_storeconfigs_backend   => 'puppetdb',
  server_ssl_dir                => '/etc/puppet/ssl',
  server_certname               => 'pm.localdomain',

  server_passenger_max_pool     => 4, #default is 12
  server_foreman_url            => 'https://foreman.localdomain',
  server_foreman_ssl_ca         => '/etc/puppet/ssl/certs/ca_crt.pem',
  server_foreman_ssl_cert       => '/etc/puppet/ssl/certs/pm.localdomain.pem',
  server_foreman_ssl_key        => '/etc/puppet/ssl/private_keys/pm.localdomain.pem',
  server_enc_api                => 'v2',
  server_report_api             => 'v2',
  
}

# Here we configure the puppet master to use PuppetDB,
# and tell it that the hostname is ‘puppetdb’
class { 'puppetdb::master::config':
  puppetdb_server => 'puppetdb',
}