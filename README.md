# UEFI Secure Boot on ArchLinux

Secure Boot is a security feature found in the UEFI standard, designed to add a layer of protection to the pre-boot process by maintaining a cryptographically signed list of binaries authorized or forbidden to run at boot stage, it helps in improving the confidence that the core boot components haven't been tampered with.

Here we will enable UEFI secure boot by signing the grub boot loader with secure boot keys.

## Prerequisites

Go to BIOS/UEFI setup, and enable secure boot.
```
Settings > Secure Boot > Secure Boot Enable
```

Delete all pre-loaded keys.
```
Settings > Secure Boot > Expert Key Management > Enable Custom Mode + Delete All Keys
```
Currently its in Secure Boot setup mode.

Set Admin Password for BIOS.
```
Settings > Security > Admin Password
```

Disable Allow Non-Admin Password Changes
```
Settings > Security > Password Change > Disable Allow Non-Admin Password Changes
```

Disable UEFI Capsule Firmware Updates
```
Settings > Security > UEFI Capsule Firmware Updates > Uncheck Enable UEFI Capsule Firmware Updates
```

Disable OROM Keyboard Access
```
Settings > Security > OROM Keyboard Access > Disabled
```

Enable Admin setup Lockout
```
Settings > Security > Admin setup Lockout > Check Enable Admin setup Lockout
```

Enable Master Password Lockout
```
Settings > Security > Master Password Lockout > Check Enable Master Password Lockout
```

Exit BIOS and boot into the system.

## Install

Install the dependencies,
```
pacman -S efitools sbsigntools
```

Install the secureboot utility,
```
git clone https://github.com/saravanan30erd/secureboot
cd secureboot
make install
```

## Configure

Generate the UEFI secure boot keys.
```
secureboot generate-keys
```

Enrolling secure boot keys in UEFI firmware.
```
secureboot enroll-keys
```

Signing the boot loader with secure boot keys.
```
secureboot sign-keys
```

Verify the signed boot loader.
```
secureboot verify-bootloader
```
