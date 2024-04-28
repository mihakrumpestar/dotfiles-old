# OnlyKey

OnlyKey:

```sh
onlykey-cli fwversion
onlykey-cli getlabels

# Config mode
onlykey-cli idletimeout 120 # 120 minutes
onlykey-cli wipemode 2 # Full wipe

onlykey-cli keytypespeed 9 # default is 7
onlykey-cli hmackeymode 0 # Button press required
```

Firmware:

- 3.0.4: backup/restore works for normal keys, but have to test if it works for FIDO2 keys

Sources:

- [OnlyKey cli docs](https://docs.onlykey.io/command-line.html)
