class seyren::service {

  file { '/etc/init/seyren.conf' :
    ensure  => present,
    content => template('seyren/etc/init/seyren_upstart.conf.erb'),
  }

}
