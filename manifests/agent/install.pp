class check_mk::agent::install{

  common::down_resources {$check_mk::agent::repo_resource_agent:
    scheme    => $check_mk::agent::repo_scheme,
    domain    => $check_mk::agent::repo_domain,
    port      => $check_mk::agent::repo_port,
    user      => $check_mk::agent::repo_user,
    pass      => $check_mk::agent::repo_pass,
    path      => $check_mk::agent::repo_path,
  }

  exec {'check_mk_agent_install_package':
    cwd     => '/tmp/',
    command => "${check_mk::params::installer} -i check-mk-agent*",
    require => Common::Down_resources[$check_mk::agent::repo_resource_agent],
    unless  => '/usr/bin/test -d /etc/xinetd.d/check_mk'
  }
}
