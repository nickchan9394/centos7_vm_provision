# C++ Development Kit
class cpp_sdk (
) {

  exec { 'Install C++ Development Kit' :
    command  => 'yum groupinstall "Development Tools" -y',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => 'root',
  }

}
