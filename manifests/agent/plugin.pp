define check_mk::agent::plugin (

  $ensure = 'present',

) {

  include check_mk::agent

  $agent_plugin_dir = $check_mk::params::agent_plugin_dir

  case $ensure {
    'present' : {
      file { "active_site_$name":
        ensure => present,
        path   => "${agent_plugin_dir}/${name}",
        source => "puppet:///modules/${module_name}/agent_plugins/${name}",
        owner  => 'root',
        group  => 'root',
        mode   => '0755'
      }
    }
    'absent': {
      file { "active_site_$name":
        ensure => absent,
        path   => "${agent_plugin_dir}/${name}",
      }
    }
    default: { err ( "Unknown ensure value: '$ensure'" ) }
  }
}
