# Class: wpcli
#
# This class downloads WP-CLI
#
# Parameters:
#
#  source: (default https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar )
#    Location of the download
#
# Actions:
#   - Install WP-CLI
#   - Make wp-cli.phar executable
#   - Symlink wp-cli.phar to wp-cli
#
# Requires:
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'wpcli': }
#
#  To specify an alternate download link, use:
#
#    class { 'wpcli':
#      source => 'http://alternate.domain.tld/wp-cli.phar'
#    }
#
class wpcli (
  $source = 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
){
  exec { 'get-wpcli':
    path    => '/bin:/usr/bin',
    command => "wget ${source}'
    cwd     => '/usr/local/bin',
    creates => '/usr/local/bin/wp-cli.phar',
    timeout => 10000,
    onlyif  => "test ! -f /usr/local/bin/wp-cli.phar",
  }

  file { '/usr/local/bin/wp-cli.phar':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Exec['get-wpcli'],
  }

  file { '/usr/local/bin/wp-cli':
    ensure  => 'link',
    owner   => 'root',
    group   => 'root',
    target  => '/usr/local/bin/wp-cli.phar',
    require => Exec['get-wpcli'],
  }

}
