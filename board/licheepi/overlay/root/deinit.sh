reset(){
    echo deinit
    # enable wdt: 0xB1 -16s wait  0x1 -0s wait
    #/media/mem w 0x01C20000 0xCB8 0xB1
    devmem 0x01C20CB8 w 0xB1
    /sbin/reboot
    exit
}
reset
