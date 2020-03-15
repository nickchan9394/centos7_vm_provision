# Install new version of git
class git (
) {

  exec { 'Remove older version of git' :
    command  => 'yum remove git -y',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => 'root',
  }
  -> exec { 'Install git2u' :
    command  => 'yum install git2u -y',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => 'root',
  }

}
