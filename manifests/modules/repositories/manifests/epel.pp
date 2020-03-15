# Install epel repository
class repositories::epel (
) {

  exec { 'Install epel Repository' :
    command  => 'yum install -y epel-release ',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => 'root',
  }

}
