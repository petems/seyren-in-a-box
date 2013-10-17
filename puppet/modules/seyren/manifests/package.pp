class seyren::package {

  package{ [
    'git',
    'curl',
    'maven',
    'openjdk-7-jdk',
    ] :
    ensure  => latest,
  }

  exec { 'clone-seyren':
    creates   => '/opt/seyren',
    command   => 'git clone https://github.com/scobal/seyren /opt/seyren',
    require   => [
      Package['git'],
      Exec['add-github-to-trusted']
    ],
  }

  file {'/opt/seyren' :
    ensure => directory,
    mode   => '0740',
    owner  => 'root',
    group  => 'root',
    require => Exec['clone-seyren'],
  }

  exec { 'change-ref-of-seyren':
    cwd => '/opt/seyren',
    command => 'git checkout c29cb041197e1441f2ed192b677d5442d97d8195',
    require => File['/opt/seyren'],
  }

  exec { 'build-with-maven':
    cwd => '/opt/seyren',
    command => 'mvn clean package',
    require => Exec['change-ref-of-seyren'],
  }

  exec { 'add-github-to-trusted':
    command => 'ssh -o StrictHostKeyChecking=no git@github.com || true'
  }

}
