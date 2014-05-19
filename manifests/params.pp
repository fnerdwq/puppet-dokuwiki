# set flavor specific variables (private)
class dokuwiki::params {

  $basedir      = '/var/www'
  $download_url = 'http://download.dokuwiki.org/src/dokuwiki'
  $version      = 'stable' # or e.g. 2014-05-05

  case $::osfamily {
    'Debian': {
      $www_owner = 'www-data'
    }
    'RedHat': {
      $www_owner = 'apache'
    }
    default:  {
      fail("Module ${module_name} is not supported on ${::operatingsystem}/${::osfamily}")
    }

  }
}
