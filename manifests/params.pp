class check_mk::params {

  $repo_scheme = hiera('sp_repo_scheme')
  $repo_domain = hiera('sp_repo_domain')
  $repo_port   = hiera('sp_repo_port')
  $repo_user   = hiera('sp_repo_user')
  $repo_pass   = hiera('sp_repo_pass')
  $repo_path   = hiera('sp_repo_path')

  $agent_plugin_dir = '/usr/lib/check_mk_agent/plugins'

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $installer   = '/usr/bin/dpkg'
      $package_agent = [
        'check-mk-agent_1.2.6p12-1_all.deb',
        'check-mk-agent-logwatch_1.2.6p12-1_all.deb'
      ]
    }
    /^(Redhat|CentOS)$/: {
      $installer   = '/bin/rpm'
      $package_agent = [
        'check_mk-agent-1.2.5i2p1-1.noarch.rpm',
        'check_mk-agent-logwatch-1.2.5i2p1-1.noarch.rpm'
      ]
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
