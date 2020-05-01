# Install GNOME
class gnome (
) {

  exec { 'Install GNOME' :
    command   => 'yum groupinstall "GNOME Desktop" -y && systemctl set-default graphical.target',
    path      => '/usr/bin:/usr/sbin:/bin',
    provider  => 'shell',
    onlyif    => 'test `yum list installed | grep gnome | wc -l` -eq 0',
    timeout   => 0,
    user      => 'root',
    logoutput => true,
  }

}
