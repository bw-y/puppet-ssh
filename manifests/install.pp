class ssh::install {
  package { $::ssh::pkgs:
    ensure => $::ssh::pkg_ensure,
  }
}
