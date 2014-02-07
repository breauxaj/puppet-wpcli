class wpcli {
  exec { 'download-wpcli':
    path    => '/bin:/usr/bin',
    command => 'wget https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
    cwd     => '/usr/bin',
    creates => '/usr/bin/wp-cli.phar',
    timeout => 10000,
    require => Package['php'],
  }

  file { '/usr/bin/wp-cli.phar':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Exec['download-wpcli'],
  }

  file { '/usr/bin/wp':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => '/usr/bin/wp-cli.phar',
    require => File['/usr/bin/wp-cli.phar'],
  }

}
