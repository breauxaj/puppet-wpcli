wpcli
=====

WP-CLI is a set of command-line tools for managing WordPress installations. You
can update plugins, set up multisite installs and much more, without using a web
browser.

http://wp-cli.org/

Samples
-------
```
include wpcli
```
```
class { 'wpcli':
  source => 'https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
}
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com
