# SOPS

Generate keys:

```sh
age-keygen

 export SOPS_AGE_RECIPIENTS=
 export SOPS_AGE_KEY=
```

Encrypt file:

```sh
sops -e -a [SOPS_AGE_RECIPIENTS] .env > .env
# or
sops -e .env > .env
# or
sops -e -i .env

# Edit file in memory
sops [file]

# Pass virtual non-encrypted file to other prosesses ('{}' is the file location placeholder)
sops exec-file --no-fifo .env 'docker-compose -f docker-compose.yml --env-file {} up -d --force-recreate'
# or using exec-env
```
