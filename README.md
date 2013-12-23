# ghoneycutt/types
===

Puppet module to manage default types through hashes in Hiera with the
create_resources() function. This module adds validation and helper functions,
such as ensuring directories. Without specifying any hashes, this module will take no action.

You can add any of the supported options for the types in this module. Please see the Puppet Labs [Type Reference](http://docs.puppetlabs.com/references/stable/type.html) for more information.

[![Build Status](https://api.travis-ci.org/ghoneycutt/puppet-module-types.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-types)

===

# Compatibility

This module targets Puppet v3.

===

# Parameters

mounts
------
Hash of resource type `mount`.

- *Default*: undef

files
------
Hash of resource type `file`.

- *Default*: undef

===

# Defines

## `types::mount`

Besides ensuring the mount resource, will also ensure that the directory for
the mount exists.

If `options` parameter is passed and it is set to 'defaults' on osfamily
Solaris, it will use '-' as the mount option instead of 'defaults', as
'defaults' is not supported on Solaris.

### Parameters required or with defaults

device
------

- *Required*

fstype
------
Mount type.

- *Required*

ensure
------
State of mount.

- *Default*: mounted

atboot
------
Boolean to mount at boot.

- *Default*: true

### Optional parameters. See type reference for more information.

`blockdevice`, `dump`, `options`, `pass`, `provider`, `remounts`, `target`

## `types::file`

Ensures the file resource.

### Parameters required or with defaults

ensure
------
Type of file resource.

- *Required*

Valid values are : present, absent, file, directory, link

owner
------
owner of resource.

- *Default*: root

group
------
group of resource.

- *Default*: root

mode
------
Permission mode of resource.

- *Default*: 0644

### Optional parameters. See type reference for more information.

`content`, `backup`, `checksum`, `force`, `ignore`, `links`, `provider`, `purge`, `recurse`, `recurselimit`, `replace`, `selinux_ignore_defaults`, `selrange`, `selrole`, `seltype`, `seluser`, `show_diff`, `source`, `sourceselect`, `target`

###
# Hiera

## mount
<pre>
types::mounts:
  /mnt:
    device: /dev/dvd
    fstype: iso9660
    atboot: no
    remounts: true
  /srv/nfs/home:
    device: nfsserver:/export/home
    fstype: nfs
    options: rw,rsize=8192,wsize=8192
</pre>

## file
<pre>
  /tmp/file1:
    ensure: present
    mode: 0755
    owner: some_user
    group: some_group
  /localdisk:
    ensure: directory
    mode: 0777
    owner: root
    group: root
    content: "This is the content"
  /softlink:
    ensure: link
    target: '/etc/motd'
</pre>

