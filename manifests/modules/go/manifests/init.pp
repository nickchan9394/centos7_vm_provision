# Install go
class go (
  String $user,
  String $go_version,
) {

  $package_download_path = "/home/${user}/Downloads";
  $package_install_path = "/home/${user}/Packages"

  file { $package_download_path:
    ensure => directory,
    path   => $package_download_path,
    owner  => $user,
  }
  -> file { $package_install_path:
    ensure => directory,
    path   => $package_install_path,
    owner  => $user,
  }
  -> exec { 'Download go tool' :
    command   => "cd ${package_download_path} && curl -X GET  https://dl.google.com/go/${go_version}.tar.gz -O",
    path      => '/usr/bin:/usr/sbin:/bin',
    provider  => 'shell',
    timeout   => 0,
    user      => $user,
    onlyif    => "test ! -f '${package_download_path}/${go_version}.tar.gz'",
    logoutput => true,
  }

  exec { 'Install go' :
    command     => "tar -C ${package_install_path} -xzf ${package_download_path}/${go_version}.tar.gz",
    path        => '/usr/bin:/usr/sbin:/bin',
    provider    => 'shell',
    timeout     => 0,
    user        => $user,
    refreshonly => true,
    subscribe   => Exec['Download go tool'],
  }

  exec{ 'Add env path':
    command     => "echo \'export PATH=\$PATH:${package_install_path}/go/bin:\' >> /home/${user}/.bashrc",
    path        => '/usr/bin:/usr/sbin:/bin',
    provider    => 'shell',
    timeout     => 0,
    user        => $user,
    refreshonly => true,
    subscribe   => Exec['Install go'],
  }

}
