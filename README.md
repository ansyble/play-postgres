# Play postgres

[![Build Status](https://travis-ci.org/ansyble/play-postgres.svg?branch=master)](https://travis-ci.org/ansyble/play-postgres)

* Vault:

> You should create a `.vaultpass` file with the *vault-password* in a single line.

* Commands:

```sh
$ make help
Please use `make <target>' where <target> is one of
  encrypt       Encrypting unencrypted keys
  decrypt       Decrypting encrypted keys
  install       Install roles dependencies
  play          Executing playbooks
```

* Server orchestration:

```sh
$ make play inventory=domake.io playbook=[databases|backups] tags=tag1,tag2
```
