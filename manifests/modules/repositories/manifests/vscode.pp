# Install vscode repository
class repositories::vscode (
) {

  exec { 'Install Microsoft RPM' :
    command  => 'sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => 'root',
  }
  -> exec { 'Setup VSCode Repo':
    command  => "sh -c 'echo -e \"[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc\" > /etc/yum.repos.d/vscode.repo'",
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => 'root',
  }
  -> exec { 'Update Yum':
    command  => 'yum check-update',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    returns  => [0,100],
    user     => 'root',
  }

}
