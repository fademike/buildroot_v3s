LIMIT_NET=20
i=0
reset(){
    echo "reset"
    if who | grep -q 'root'; then 
      echo "user login.exit."
      exit
    fi
    echo 1 > /sys/class/leds/led3/brightness
    /media/deinit.sh
    exit
}
check_reset(){
  if [ "$i" -ge "$LIMIT_NET" ]; then 
    reset
  fi
  i=$((i+1))
}

/media/rtsp_run.sh

echo 0 > /sys/class/leds/led2/brightness
echo "wait connection..."
while ! ip a | grep -q 'wlan' ; do check_reset; sleep 1; done;
while ! ip a | grep -q '192.168.' ; do check_reset; sleep 1; done;
echo 0 > /sys/class/leds/led3/brightness
while [ 1 -eq 1 ]
do
  # reset wdt 16s
  #/media/mem w 0x01C20000 0xCB8 0xB1
  if ! ip a | grep -q '192.168.'; then 
    echo ip fail
    check_reset
  fi
  if ! ip a | grep -q 'wlan0'; then 
    echo net fail
    check_reset
  fi
  if ! ps -A | grep -q 'test-launch'; then 
    echo rtsp fail
    check_reset
  fi
  sleep 1
done

