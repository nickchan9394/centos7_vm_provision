# Install VS Code
class vscode(
  String $user
) {

  exec { 'Install VSCode' :
    command  => 'yum install code -y',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => 'root',
  }
  -> exec { 'Install VSCode Extensions' :
    command  => 'code --install-extension ms-vscode.cpptools; code --install-extension ms-vscode.Go',
    path     => '/usr/bin:/usr/sbin:/bin',
    provider => 'shell',
    timeout  => 0,
    user     => $user,
  }

}
