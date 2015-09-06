class ssh::service {

  service { 'ssh':
    ensure     => $::ssh::service_ensure,
    enable     => $::ssh::service_enable,
    name       => $::ssh::service_name,
    hasstatus  => true,
    hasrestart => true,
  }

}
