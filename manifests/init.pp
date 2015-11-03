#
class ssh (
  $sshd_port          = [ '22' ],
  $sshd_servers       = [ '0.0.0.0' ],
  $sshd_sftp          = false,
  $sshd_rootlogin     = 'yes',
  $sshd_usedns        = 'no',
  $ssh_gssapiauth     = 'no',
  $ssh_firstcheck     = 'no',

  $stage              = 'runtime'
) inherits ::ssh::params {

  anchor { 'ssh::begin': } ->
  class { '::ssh::install': } ->
  class { '::ssh::config': } ~>
  class { '::ssh::service': } ->
  anchor { 'ssh::end': }

}
