class ssh::params {

  $sshd_conf      = '/etc/ssh/sshd_config'
  $ssh_conf       = '/etc/ssh/ssh_config'
  $pub_pkgs       = [ 'openssh-server' ]
  $pkg_ensure     = 'present'
  $service_ensure = 'running'
  $service_enable = true

  case $::osfamily {
    'Debian' : {
       $sshd_temp    = 'ssh/deb-conf-sshd.erb'
       $ssh_temp     = 'ssh/deb-conf-ssh.erb'
       $sshd_mode    = '0644'
       $pri_pkgs     = [ 'openssh-client' ]
       $pkgs         = flatten([$pub_pkgs, $pri_pkgs])
       $service_name = 'ssh'
    }
    'RedHat' : {
       $sshd_temp    = 'ssh/rpm-conf-sshd.erb'
       $ssh_temp     = 'ssh/rpm-conf-ssh.erb'
       $sshd_mode    = '0600'
       $pri_pkgs     = [ 'openssh-clients' ]
       $pkgs         = flatten([$pub_pkgs, $pri_pkgs])
       $service_name = 'sshd'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
