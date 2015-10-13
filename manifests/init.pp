class wpcli (
  $source = 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
){
  exec { 'get-wpcli':
    path    => '/bin:/usr/bin',
    command => "wget ${source}'
    cwd     => '/usr/bin',
    creates => '/usr/bin/wp-cli.phar',
    timeout => 10000,
    onlyif  => "test ! -f /usr/bin/wp-cli.phar",
  }

  file { '/usr/bin/wp-cli.phar':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Exec['get-wpcli'],
  }

  file { '/usr/bin/wp':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => '/usr/bin/wp-cli.phar',
    require => Exec['get-wpcli'],
  }

}
