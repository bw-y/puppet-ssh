# ssh

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with ssh](#setup)
    * [What ssh affects](#what-ssh-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ssh](#beginning-with-ssh)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

一个简单管理ssh的puppet模块

## Module Description

此模块仅对ssh服务进行安装、简单配置并管理其运行状态；此模块不提供删除ssh的功能。

## Setup

### What ssh affects

* openssh package
* openssh configuration
* openssh service

### Setup Requirements **OPTIONAL**

由于模块在安装ssh包的时候会用到源，请使用之前确认软件源正常工作

### Beginning with ssh
If you just want server and client being installed and use with default option
```
node 'node1.hypers.com' {
  class { '::ssh': }
}
```
## Usage
If you want managed ssh certain options:
```
node 'node1.bw-y.com' {
  class { '::ssh':
    sshd_port          => [ '22', '22022' ],
    sshd_servers       => [ '192.168.0.11', '10.0.0.11' ],
    sshd_usedns        => 'no',
    ssh_gssapiauth     => 'no',
    ssh_ssh_firstcheck => 'no',
  }
}
```

## Reference

#### Public Classes

* ssh: Main class, includes all other classes.

#### Private Classes
* ssh::install   currently install openssh
* ssh::config    manages configuration
* ssh::service   manages service 

### Parameters

The following parameters are available in the ::ssh class:

#### `sshd_port`

配置一个或多个ssh服务的监听端口. 有效数据类型: 数组. 默认值: [ '22' ]

#### `sshd_servers`

配置一个或多个ssh服务的监听IP. 有效数据类型: 数组. 默认值: [ '0.0.0.0' ]

#### `sshd_usedns`

ssh DNS解析. 有效值 no:关闭；yes:开启.  默认值 no

#### `ssh_gssapiauth`

ssh客户端的GSSAPI认证，关闭可以提升ssh连接速度。  有效值 no:关闭；yes:开启.  默认值 no

#### `ssh_ssh_firstcheck`

ssh客户端首次连接时是否询问yes/no，关闭则不询问。  有效值 no:关闭；yes:开启.  默认值 no


## Limitations

目前仅支持系统如:  rhel/centos(5/6) , ubuntu12.04/14.04

## Development
