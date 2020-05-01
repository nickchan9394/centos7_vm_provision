# Add user
class add_user (
  String $user,
  String $password,
  String $group = 'root',
){
  user { $user:
    ensure     => 'present',
    managehome => true,
    shell      => '/bin/bash',
    gid        => $group,
  }
  -> exec { 'Set initial password':
    command => "echo ${user}:${password} | chpasswd",
    path    => '/usr/bin:/usr/sbin:/bin',
    user    => 'root'
  }
  -> exec { 'No password when sudo':
    command => "echo '${user} ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/${user}",
    path    => '/usr/bin:/usr/sbin:/bin',
    user    => 'root'
  }
}
