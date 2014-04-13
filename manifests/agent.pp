class check_mk::agent (

  $repo_scheme         = $check_mk::params::repo_scheme,
  $repo_domain         = $check_mk::params::repo_domain,
  $repo_port           = $check_mk::params::repo_port,
  $repo_user           = $check_mk::params::repo_user,
  $repo_pass           = $check_mk::params::repo_pass,
  $repo_path           = $check_mk::params::repo_path,
  $repo_resource_agent = $check_mk::params::package_agent,

) inherits check_mk::params {

  anchor{'check_mk::agent::begin':
    before  => Class['check_mk::agent::install']
  }

  class{'check_mk::agent::install':
    require => Anchor['check_mk::agent::begin']
  }

  class{'check_mk::agent::config':
    require => Class['check_mk::agent::install'],
  }

  class{'check_mk::agent::service':
    subscribe => Class['check_mk::agent::config'],
  }

  anchor{'check_mk::agent::end':
    require => Class['check_mk::agent::service']
  }
}
