class ssh::config {

  file { $::ssh::sshd_conf:
    content => template($::ssh::sshd_temp),
    mode    => $::ssh::sshd_mode,
    owner   => 0,
    group   => 0,
    backup  => ".$::backup_date",
  }

  file { $::ssh::ssh_conf:
    content => template($::ssh::ssh_temp),
    mode    => $::ssh::sshd_mode,
    owner   => 0,
    group   => 0,
    backup  => ".$::backup_date",
  }

}
