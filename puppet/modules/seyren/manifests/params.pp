class seyren::params {
  case $::osfamily {
    debian, ubuntu: { }
    default: {
      fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
    }
  }
}