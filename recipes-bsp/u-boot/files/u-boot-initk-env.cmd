arch=arm
baudrate=115200
board=evb_px30
board_name=evb_px30
bootdelay=2
cpu=armv8
bootimg=fitImage
fdt_addr_r=0x08300000
loadaddr=0x800800
fdtimage=px30-evb.dtb
bootcmd=run mmcload; run mmcboot
mmcbootpart=6
mmcloadcmd=fatload
mmcload=mmc rescan;${mmcloadcmd} mmc 0:${mmcbootpart} ${loadaddr} ${bootimg}
mmcboot=setenv bootargs "earlycon=uart8250,mmio32,0xff160000 swiotlb=1 console=ttyS2,115200n8 rw root=/dev/mmcblk2p7 rootfstype=ext4 rootwait"; bootm ${loadaddr}
read_rec_key=adc single saradc@ff288000 2 rec_key
preboot=run read_rec_key; test ${rec_key} -le 30000 && rockusb 0 mmc 0