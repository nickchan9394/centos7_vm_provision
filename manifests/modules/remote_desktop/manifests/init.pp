# Install Remote Desktop
class remote_desktop (
  Integer $port
) {

  exec { 'Install xrdp & tigervnc-server' :
    command  => 'yum install -y xrdp tigervnc-server',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => 'root',
  }
  -> service { 'Enable xrdp' :
    ensure => 'running',
    name   => 'xrdp',
    enable => true,
  }
  -> service { 'Enable firewalld' :
    ensure => 'running',
    name   => 'firewalld',
    enable => true,
  }
  -> exec { 'Setup firewall' :
    command  => "firewall-cmd --permanent --zone=public --add-port=${port}/tcp && firewall-cmd --reload",
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => 'root',
  }

}
