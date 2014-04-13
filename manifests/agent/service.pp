class check_mk::agent::service {

  exec{ 'check_mk_service':
    command => '/etc/init.d/xinetd restart',
  }
}
