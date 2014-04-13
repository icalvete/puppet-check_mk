class check_mk (

  $repo_scheme         = $check_mk::params::repo_scheme,
  $repo_domain         = $check_mk::params::repo_domain,
  $repo_port           = $check_mk::params::repo_port,
  $repo_user           = $check_mk::params::repo_user,
  $repo_pass           = $check_mk::params::repo_pass,
  $repo_path           = $check_mk::params::repo_path,

) inherits check_mk::params {

  anchor{'check_mk::begin':
    before  => Class['check_mk::install']
  }

  class{'check_mk::install':
    require => Anchor['check_mk::begin']
  }

  class{'check_mk::config':
    require => Class['check_mk::install'],
  }

  anchor{'check_mk::end':
    require => Class['check_mk::config']
  }
}
