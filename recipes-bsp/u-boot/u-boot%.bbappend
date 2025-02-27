
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " file://00_rockusb.cfg"
SRC_URI += "file://uboot-fix.patch"
SRC_URI += "file://u-boot-initk-env.cmd"
SRC_URI += "file://01_use_default_env.cfg"

DEPENDS:append = " xxd-native"

#do_configure:prepend:px30() {
#    sed -i 's/\(fdtimage=\).*/\1${RK_KERNEL_DEVICETREE}/' ${S}/../u-boot-initk-env.cmd
#}

do_deploy:append:px30() {
    install -D -m 644 ${B}/spl/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-${MACHINE}-${PV}-${PR}.bin
    install -D -m 644 ${B}/tpl/u-boot-tpl.bin ${DEPLOYDIR}/u-boot-tpl-${MACHINE}-${PV}-${PR}.bin

    cd ${DEPLOYDIR}
    ln -sf u-boot-tpl-${MACHINE}-${PV}-${PR}.bin u-boot-tpl-${MACHINE}.bin
    ln -sf u-boot-tpl-${MACHINE}-${PV}-${PR}.bin u-boot-tpl.bin
    ln -sf u-boot-spl-${MACHINE}-${PV}-${PR}.bin u-boot-spl-${MACHINE}.bin
    ln -sf u-boot-spl-${MACHINE}-${PV}-${PR}.bin u-boot-spl.bin
}