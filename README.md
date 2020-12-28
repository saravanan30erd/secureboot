# Enable Secure Boot

1. Go to BIOS setup, and enable secure boot.
```
Settings > Secure Boot > Secure Boot Enable
```

2. Delete all pre-loaded keys.
```
Settings > Secure Boot > Expert Key Management > Enable Custom Mode + Delete All Keys
```
Currently its in Secure Boot setup mode.

3. Set Admin Password for BIOS.
```
Settings > Security > Admin Password
```

4. Exit BIOS and boot into the system.

5. Install the dependencies,
```
pacman -S efitools sbsigntools
```

6. Install the secureboot utility,
```
git clone https://github.com/saravanan30erd/uefi-secureboot
cd uefi-secureboot
make install
```

7. Generate the UEFI secure boot keys.
```
secureboot -g
```

8. Enrolling secure boot keys in UEFI firmware.
```
secureboot -e
```

9. Signing the boot loader with secure boot keys.
```
secureboot -s
```

10. Verify the signed boot loader.
```
secureboot -v
```
