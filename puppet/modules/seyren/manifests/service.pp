class seyren::service {

  service { 'seyren' :
    ensure    => running,
    provider  => upstart,
    subscribe => File['/etc/init/seyren.conf'],
  }

}
