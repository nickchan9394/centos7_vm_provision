# Install git repository
class repositories::git (
) {

  exec { 'Install git Repository' :
    command  => 'yum install -y https://repo.ius.io/ius-release-el7.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    returns  => [0,1],
    user     => 'root',
  }

}
