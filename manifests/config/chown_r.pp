# (private) chwon -R helper
define dokuwiki::config::chown_r (
  $directory = $title,
  $owner     = 'root',
  $group     = 'root',
) {

  exec { "recursive chown on ${directory}":
    command => "chown -R ${owner}:${group} ${directory}",
    unless  => "test $(stat -c %U:%G ${directory}) = ${owner}:${group}",
    path    => ['/bin', '/usr/bin'],
  }

}
