# configures dokuwiki (private)
class dokuwiki::config (
  $basedir = $dokuwiki::params::basedir,
  $version = $dokuwiki::params::version,
) {

  $version_string = "dokuwiki-${version}"

  file { ["${basedir}/${version_string}/conf",
          "${basedir}/${version_string}/lib/plugins",
          "${basedir}/${version_string}/lib/tpl"]:
    ensure  => directory,
    recurse => true,
    owner   => $dokuwiki::params::www_owner,
  }
  # If this resource is made recursive, you can get a huge report on each run:
  # ~750 bytes per file, and dokuwiki keeps old revisions in files. BCLibCoop
  # private wiki caused a 450MB growth in the report :-(.
  file { "${basedir}/${version_string}/data":
    ensure  => directory,
    owner   => $dokuwiki::params::www_owner,
    recurse => false,
  }

}
