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
    command   => '(ssh -o StrictHostKeyChecking=no git@github.com || true) && git clone https://github.com/scobal/seyren /opt/seyren && git checkout c29cb041197e1441f2ed192b677d5442d97d8195 && mvn clean package',
    require   => [
      Package['git'],
    ]
  }

}
