class check_mk::params {

  $repo_scheme = hiera('sp_repo_scheme', 'http')
  $repo_domain = hiera('sp_repo_domain', 'smarpurposes.s3-website-eu-west-1.amazonaws.com')
  $repo_port   = hiera('sp_repo_port', '')
  $repo_user   = hiera('sp_repo_user', '')
  $repo_pass   = hiera('sp_repo_pass', '')
  $repo_path   = hiera('sp_repo_path', '')

  $agent_plugin_dir = '/usr/lib/check_mk_agent/plugins'

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $installer     = '/usr/bin/dpkg'
      $package_agent = 'check-mk-agent_2.0.0p10-1_all.deb'
    }
    /^(Redhat|CentOS)$/: {
      $installer     = '/bin/rpm'
      $package_agent = 'check-mk-agent-2.0.0p10-1.noarch.rpm'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
