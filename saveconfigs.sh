#!/bin/sh
set -e

PI3_DEFCONFIG="configs/narraipi3_64_defconfig"
ZERO2W_DEFCONFIG="configs/narraipizero2w_64_defconfig"

PI3_DTS='BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"'
ZERO2W_DTS='BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"'

echo "Saving current configuration..."
make savedefconfig

echo "Copying ${PI3_DEFCONFIG} -> ${ZERO2W_DEFCONFIG}"
cp "${PI3_DEFCONFIG}" "${ZERO2W_DEFCONFIG}"

echo "Updating DTS for Zero 2 W..."
sed -i \
  "s|${PI3_DTS}|${ZERO2W_DTS}|" \
  "${ZERO2W_DEFCONFIG}"

echo "Done."
