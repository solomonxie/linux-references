# Progressive Boot Process Lessons

A step-by-step series learning the Linux boot process — BIOS/UEFI, GRUB,
initramfs, and init — a useful contrast to the OpenRC/systemd folders.
Each step is a standalone file.

Steps:

| Step | Topic |
|---|---|
| 01 | BIOS/UEFI → bootloader → kernel → init, the full chain |
| 02 | UEFI (ESP, `efibootmgr`, Secure Boot) vs legacy BIOS/MBR |
| 03 | GRUB config basics |
| 04 | initramfs, `lsinitrd`/`dracut` basics |
| 05 | `/proc/cmdline`, kernel boot parameters |
| 06 | advanced: sysvinit vs OpenRC vs systemd as PID 1 |
