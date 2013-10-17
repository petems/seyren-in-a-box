class seyren::config  {

  file{ '/opt/seyren/run_seyren.sh' :
    ensure  =>  present,
    mode    => '0740',
    owner   => 'root',
    group   => 'root',
    content =>  template('seyren/opt/seyren/run_seyren.sh.erb'),
    replace =>  true,
    require =>  File['/opt/seyren'],
  }

  file { '/etc/init/seyren.conf' :
    ensure  => present,
    mode    => '0740',
    owner   => 'root',
    group   => 'root',
    content => template('seyren/etc/init/seyren_upstart.conf.erb'),
  }

}
