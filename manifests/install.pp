# downloads and installs dokuwiki (private)
class dokuwiki::install (
  $download_url  = $dokuwiki::params::download_url,
  $basedir       = $dokuwiki::params::basedir,
  $version       = $dokuwiki::params::version,
) {

  ensure_resource('file', '/var/local/packages', {'ensure' => 'directory'})

  $version_string = "dokuwiki-${version}"
  $install_file   = "${version_string}.tgz"

  archive { $version_string:
    ensure           => present,
    url              => "${download_url}/${install_file}",
    src_target       => '/var/local/packages',
    checksum         => false,
    extension        => 'tgz',
    target           => $basedir,
    root_dir         => $version_string,
    strip_components => 1,
  }

  # to avoid double directory handling (basedir it is created by apache::vhost)
  # -> 'archive' would not extract (due to 'creates' check in exec)
  file {"${basedir}/dokuwiki":
    ensure  => link,
    target  => "${basedir}/${version_string}",
    require => Archive[$version_string],
  }


}
