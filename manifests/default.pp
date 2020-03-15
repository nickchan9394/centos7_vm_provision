node default {

  $user = 'nick'

  user { $user:
    ensure     => 'present',
    managehome => true,
    shell      => '/bin/bash',
    gid        => 'wheel'
  }
  -> class { 'repositories::epel': }
  -> class { 'repositories::vscode': }
  -> class { 'repositories::git': }
  -> class { 'gnome': }
  -> class { 'remote_desktop':
    port => 3389,
  }
  -> class { 'vscode':
    user => $user
  }
  -> class { 'cpp_sdk': }
  -> class { 'git': }

}
