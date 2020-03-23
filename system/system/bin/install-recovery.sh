#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:104857600:216ac3a81532349bf374eb197a3a2ff3367bcf74; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:83223270c25a4bdae95c3abcde1eae86fd0f774f \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:104857600:216ac3a81532349bf374eb197a3a2ff3367bcf74 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
