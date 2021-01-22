# Progressive Boot Process Lessons

A step-by-step series learning the Linux boot process — BIOS/UEFI, GRUB,
initramfs, and init — a useful contrast to `hello-openrc`-style init-system
folders. Each step is a standalone `boot_NN_topic.sh`.

Steps:

| File | Topic |
|---|---|
| `boot_01_overview.sh` | BIOS/UEFI → bootloader → kernel → init, the full chain |
| `boot_02_grub.sh` | GRUB config basics |
| `boot_03_initramfs.sh` | initramfs, `lsinitrd`/`dracut` basics |
| `boot_04_kernel_params.sh` | `/proc/cmdline`, kernel boot parameters |
| `boot_05_init_systems.sh` | advanced: sysvinit vs OpenRC vs systemd as PID 1 |

