# Boot

On desktop, set C-states to prevent coil whine.

Add `intel_idle.max_cstate=1 processor.max_cstate=1` to `/etc/default/grub` to variable `GRUB_CMDLINE_LINUX_DEFAULT`.

Then run:

```sh
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Verify (after reboot):

```sh
grep . /sys/devices/system/cpu/cpu0/cpuidle/state*/name
```
