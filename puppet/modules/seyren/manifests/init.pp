class seyren {

  include seyren::params, seyren::package, seyren::config, seyren::service

  Class['seyren::package'] -> Class['seyren::config'] ~> Class['seyren::service']

}
