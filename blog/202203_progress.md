# Progress Mar 2022

## Mon 28th Mar
  - build a palm top computer?
    - as per https://www.linuxscrew.com/diy-raspberry-pi-laptop
    - keyboard
      - https://www.kogan.com/au/buy/laser-universal-7-inch-laser-tablet-case-with-keyboard-micro-usb-mid-case/
  - build your own botnet
    - https://www.tutorialspoint.com/build-your-own-botnet
    - https://www.toptal.com/chatbot/how-to-make-a-discord-bot
    - https://blog.blazeinfosec.com/bt2-leveraging-telegram-as-a-command-control-platform/
    - https://github.com/TreeHacks/botnet-hackpack
  - build bluetooth cache using ESP32 and SD card? using chrome bluetooth/wifi extension - with encryption?
  - build a remote bot anythig similar to https://github.com/4rts/slido-bot
    - input request params and remote execute via different networks
  - 2FA arduinow
    - https://tinyhack.com/2015/11/08/teensy-lc-u2f-key/
    - https://www.makeuseof.com/how-to-create-digispark-security-key/
    - https://bert.org/2020/10/01/pressing-yubikeys/
    - https://github.com/pagong/arduino-yksim
## Sat 26th Mar
  - **take another look at the wifi pineapple**
  - as per [202004_progress.md](202004_progress.md)
    - now latest firmware is still [2.7.0-stable](https://downloads.hak5.org/pineapple/nano)
    - have downloaded it, checked and installed as per [instructions](https://docs.hak5.org/wifi-pineapple-6th-gen-nano-tetra/faq-troubleshooting/manual-firmware-installation)
    ```
    scp ~/Downloads/upgrade-2.7.0.bin root@192.168.2.10:/tmp/
    sha256sum /tmp/upgrade-2.7.0.bin
    c69629ef90c715600e09f22ef12732c593f886db3b0ed145f549de551c48f79d  /tmp/upgrade-2.7.0.bin
    sysupgrade -n /tmp/upgrade-2.7.0.bin

    killall: watchdog: no process killed
    Sending TERM to remaining processes ... logd netifd atd php-fpm nginx dnsmasq ntpd pineapd ubusd askfirst
    Sending KILL to remaining processes ... ntpd askfirst
    Switching to ramdisk...
    mount: mounting overlayfs:/overlay on /mnt failed: Device or resource busy
    Performing system upgrade...
    Unlocking firmware ...

    Writing from <stdin> to firmware ...
    Upgrade completed
    Rebooting system...
    ```
  - as per [blog/201902_progress.md](blog/201902_progress.md) have already
    - setup again via
      http://172.16.42.1:1471
      ```
      ssh root@172.16.42.1
      vi /etc/config/network
      ```
   
      change
   
      ```diff
      config interface 'lan'
              ...
      -       option ipaddr '172.16.42.1'
      -       option gateway '172.16.42.42'
      +       option ipaddr '192.168.2.10'  # '172.16.42.1' is default
      +       option gateway '192.168.2.42' # '172.16.42.42' is default
      ```

      and restart only network?

      ```
      /etc/init.d/network restart
      ```
      reset connection
      - **configure IPv4:** manually
      - ** IP Address:** 192.168.1.2
      - **Subnet Mask:** 255.255.255.0 

      - ssh root@192.168.2.10
      - http://192.168.2.10:1471/
      - make sure internet connection sharing is no

    setup Pineapple to run on
    - open http://192.168.2.10:1471/
    - ssh root@192.168.2.10

    - connect from kali linux
    ```
    docker pull kalilinux/kali-rolling
    docker run --tty --interactive kalilinux/kali-rolling /bin/bash
    ```
    - [ ] stuck - how to connect Pineapple on 1 port with kali linux running
      under docker?

  - based on 
    - https://github.com/tsumarios/Kali-Linux-Dockerfile
    - https://tsumarios.medium.com/kali-linux-on-docker-container-the-easiest-way-e5a551348788
    ```
    docker build -t kali-demo .
    docker run --tty --interactive kali-demo
    ```
  - also docker on linux
    - based on https://www.youtube.com/watch?v=WutV6n21dys
    - https://github.com/AgileDevArt/AgileDevArt.github.io
    ```
    docker build -f ~/Downloads/Dockerfile.lubuntu -t lubuntu .
    ```
    - [ ] stuck cannot seem to run it?
    ```
    [+0.03s] DEBUG: DisplayServer: Connecting to XServer host.docker.internal:0
    [+0.03s] DEBUG: DisplayServer: Error connecting to XServer host.docker.internal:0
    [+0.03s] DEBUG: Seat seat0: Can't create display server for greeter
    [+0.03s] DEBUG: Seat seat0: Session stopped
    [+0.03s] DEBUG: Seat seat0: Stopping; failed to start a greeter
    [+0.03s] DEBUG: Seat seat0: Stopping
    [+0.03s] DEBUG: Seat seat0: Stopping display server
    [+0.03s] DEBUG: Seat seat0: Display server stopped
    [+0.03s] DEBUG: Seat seat0: Stopped  
    ```
  - tor
    - reading https://www.going-flying.com/blog/demystifying-the-dark-web-and-fun-with-docker.html
    ```
    brew install --cask tor-browser
    ```
    - run and check my ip
      - https://www.myip.com/
      - https://whatismyipaddress.com/
    - searching up https://tor.stackexchange.com/questions/20043/where-can-i-find-the-latest-urls-on-tor
      - found list
        - http://donionsixbjtiohce24abfgsffo2l4tk26qx464zylumgejukfq2vead.onion/
      - found cypher market
        - http://6c5qaeiibh6ggmobsrv6vuilgb5uzjejpt2n3inoz2kv2sgzocymdvyd.onion/

