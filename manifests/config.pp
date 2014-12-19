# configures dokuwiki (private)
class dokuwiki::config (
  $basedir = $dokuwiki::params::basedir,
  $version = $dokuwiki::params::version,
) {

  $version_string = "dokuwiki-${version}"

  # do recursive chown on directories, since recursive file resource
  # can be costly in large installations
  dokuwiki::config::chown_r { [
      "${basedir}/${version_string}/conf",
      "${basedir}/${version_string}/data",
      "${basedir}/${version_string}/lib/plugins",
      "${basedir}/${version_string}/lib/tpl" ]:
    owner => $dokuwiki::params::www_owner,
    group => 'root',
  }

}
