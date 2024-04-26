COMPATIBLE_MACHINE:firefly-px30 = "firefly-px30"
COMPATIBLE_MACHINE:xa-rockchip-px30-evb = "xa-rockchip-px30-evb"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# This should move to the meta-howto layer for example setup stuff
#SRC_URI += "file://00_ethernet.cfg"

# This patch will break boards that use the evb dts
SRC_URI:xa-rockchip-px30-evb += "file://debug-uart.patch"
SRC_URI += "file://firefly-px30.dts;subdir=git/arch/${ARCH}/boot/dts/rockchip"

PACKAGE_ARCH = "${MACHINE_ARCH}"