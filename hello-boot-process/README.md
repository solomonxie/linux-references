# Progressive Boot Process Lessons

A step-by-step series learning the Linux boot process — BIOS/UEFI, GRUB,
initramfs, and init — a useful contrast to the OpenRC/systemd folders.
Each step is a standalone file.

Steps:

| Step | Topic |
|---|---|
| 01. overview | BIOS/UEFI → bootloader → kernel → init, the full chain |
| 02. uefi bios | UEFI (ESP, `efibootmgr`, Secure Boot) vs legacy BIOS/MBR |
| 03. grub | GRUB config basics |
| 04. initramfs | initramfs, `lsinitrd`/`dracut` basics |
| 05. kernel params | `/proc/cmdline`, kernel boot parameters |
| 06. init systems | advanced: sysvinit vs OpenRC vs systemd as PID 1 |
