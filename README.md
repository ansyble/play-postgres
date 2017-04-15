# Play postgres

[![Build Status](https://travis-ci.org/ansyble/play-postgres.svg?branch=master)](https://travis-ci.org/ansyble/play-postgres)

* Download Ansible roles:

```sh
$ make requirements
```

* Vault:

> You should create a `.vaultpass` file with the *vault-password* in a single line.

* Server orchestration:

```sh
$ make play inventory=domake.io play=[databases|backups] tags=tag1,tag2
```
