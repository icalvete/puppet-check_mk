class check_mk::agent::install{

  realize Package['xinetd']

  $source = "${check_mk::agent::repo_scheme}://${check_mk::agent::repo_domain}/${check_mk::agent::repo_resource_agent}"

  wget::fetch {$check_mk::agent::repo_resource_agent:
    source      => $source,
    user        => $check_mk::agent::repo_user,
    password    => $check_mk::agent::repo_pass,
    destination => "/tmp/${check_mk::agent::repo_resource_agent}",
    timeout     => 0,
    verbose     => false,
  }

  exec {'check_mk_agent_install_package':
    cwd     => '/tmp/',
    command => "${check_mk::params::installer} -i check-mk-agent*",
    require => Wget::Fetch[$check_mk::agent::repo_resource_agent],
    unless  => '/usr/bin/test -d /etc/xinetd.d/check_mk'
  }
}
