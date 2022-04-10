#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9150464 b63949d735975a1ac83dd890cf7f7ae5bc771170 6924288 2312b5273fe6978344cdff22e6ebe732ed9ee995
fi

if ! applypatch -c EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY:9150464:b63949d735975a1ac83dd890cf7f7ae5bc771170; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sprd-sdhci.3/by-name/KERNEL:6924288:2312b5273fe6978344cdff22e6ebe732ed9ee995 EMMC:/dev/block/platform/sprd-sdhci.3/by-name/RECOVERY b63949d735975a1ac83dd890cf7f7ae5bc771170 9150464 2312b5273fe6978344cdff22e6ebe732ed9ee995:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
