# == Class: dokuwikie
#
# Installs dokuwiki.
#
# This works on Debian like systems.
# Puppet Version >= 3.4.0
#
# === Parameters
#
# [*basedir*]
#   Where to install to: ${basedir}/dokuwiki-${version}
#   *Optional* (defaults to /var/www)
#
# [*download_url*]
#   Where to download Tarball from.
#   *Optional* (defaults to http://download.dokuwiki.org/src/dokuwiki)
#
# [*version*]
#   Which version to install ('stable' or date like '2014-05-05')
#   Stable is not automatically updated!
#   *Optional* (defaults to stable)
#
# [*digest*]
#   MD5 digest of download digest.
#   *Optional* (defaults to undef)
#
# === Examples
#
# include dokuwiki
#
# === Authors
#
# Frederik Wagner <wagner@wagit.de>
#
# === Copyright
#
# Copyright 2014 Frederik Wagner
#
class dokuwiki (
  $basedir       = $dokuwiki::params::basedir,
  $download_url  = $dokuwiki::params::download_url,
  $version       = $dokuwiki::params::version,
  $digest        = $dokuwiki::params::digest,
) inherits dokuwiki::params {

  class {'dokuwiki::install':
    download_url => $download_url,
    basedir      => $basedir,
    version      => $version,
    digest       => $digest,
  }
  -> class {'dokuwiki::config':
    basedir => $basedir,
    version => $version,
  }

  contain dokuwiki::install
  contain dokuwiki::config

}


