# Progress Jun 2018

## Sun 10th

### RasPi picture frame

#### Dynaframe

- following https://www.youtube.com/watch?v=XEaUsaNEzjY
- to install https://github.com/Geektoolkit/Dynaframe3
- although there is a patreon pro version - might be worth checking out at some stage
- got an image https://www.raspberrypi.com/software/operating-systems/

      Raspberry Pi OS with desktop
      Release date: April 4th 2022
      System: 32-bit
      Kernel version: 5.15
      Debian version: 11 (bullseye)

- install using diskutil

      $ diskutil list
      ...
      /dev/disk4 (external, physical):
         #:                       TYPE NAME                    SIZE       IDENTIFIER
         0:     FDisk_partition_scheme                        *31.0 GB    disk4
         1:             Windows_FAT_32                         31.0 GB    disk4s1

      $ mount
      ...
      /dev/disk4s1 on /Volumes/Untitled (msdos, local, nodev, nosuid, noowners)

      $ sudo diskutil unmountDisk /dev/disk4
      Unmount of all volumes on disk4 was successful

      $ unxz 2022-04-04-raspios-bullseye-armhf.img.xz

      $ sudo dd if=2022-04-04-raspios-bullseye-armhf.img of=/dev/rdisk4 bs=1m
      4124+0 records in
      4124+0 records out
      4324327424 bytes transferred in 286.341215 secs (15102008 bytes/sec)

      $ mount
      ...
      /dev/disk4s1 on /Volumes/boot (msdos, local, nodev, nosuid, noowners)

      $ sudo diskutil unmountDisk /dev/disk4
      Unmount of all volumes on disk4 was successful

- took a while to setup
  - connected via cable and turned "Sharing" on to share Wifi from laptop to
    USB 10/100/1000 LAN which was connected to RasPi
  - defaults are usually username/password: pi/raspberry
    but was recommended to change
  - started update and screen went to sleep? - tried hard reset - opted NOT to
    do updates
  - setup vnc

        sudo raspi-config
          interfacing options -> VNC enable 
          # also ssh enable whilst I was there

  - install on MacOS

        brew install --cask vnc-viewer

- from github

      sudo \
        wget https://github.com/Geektoolkit/Dynaframe3/releases/download/2.19/install.sh && \
        bash install.sh; rm -f install.sh ; sudo reboot

      # seemed to get a segmentation fault when running
      # realised there is a newer 2.24 (draft) so tried 2.23

      sudo \
        wget https://github.com/Geektoolkit/Dynaframe3/releases/download/2.19/install.sh && \
        bash install.sh

      # still seg fault trying 2.13

      sudo wget https://github.com/Geektoolkit/Dynaframe3/releases/download/2.13/install.sh && bash install.sh

      # still seg fault

- might try original python version

      wget https://raw.githubusercontent.com/Geektoolkit/Dynaframe/master/show.py
      pip install paho-mqtt

      # might need
      sudo apt install omxplayer -y

      # unfortunately
      Package 'omxplayer' has no installation candidate

      # sounds it's phased out in preference of VLC
      # could install from source
      https://github.com/popcornmix/omxplayer

      git clone https://github.com/popcornmix/omxplayer.git
      cd omxplayer
      ./prepare-native-raspbian.sh
      make ffmpeg
      make -j$(nproc)

      # error
        linux/OMXAlsa.cpp:21:10: fatal error: alsa/asoundlib.h: No such file or directory
           21 | #include <alsa/asoundlib.h>
              |          ^~~~~~~~~~~~~~~~~~
        compilation terminated.
        make: *** [Makefile:49: linux/OMXAlsa.o] Error 1

      sudo apt-get install libasound2-dev

      # error
        Linux/OMXAlsa.cpp:22:10: fatal error: IL/OMX_Core.h: No such file or directory
           22 | #include <IL/OMX_Core.h>
              |          ^~~~~~~~~~~~~~~
        compilation terminated.
        make: ** [Makefile:49: linux/OMXAlsa.o] Error 1

      sudo make install

- ❌ DID NOT WORK IT OUT

maybe https://github.com/pikvm/ustreamer/issues/123#issuecomment-964217839

> Bullseye deprecated OMX and MMAL so it won't work anymore. They recommend
> switching to V4L2 hardware encoder, I will do it, but it will take time.

#### Feh

- trying feh instead
- via https://www.thedigitalpictureframe.com/the-best-3-image-viewers-for-your-raspberry-pi-digital-picture-frame-project/
- https://feh.finalrewind.org/

      wget https://feh.finalrewind.org/feh-3.9.tar.bz2

      # scrap building from source

      sudo dpkg --configure -a
      sudo apt install feh -a

      # failed on chromium ffmpeg dependency
      sudo apt --fix-broken install

      # try again
      sudo apt install feh -a

      # and run against some JPGs
      feh -qrYzFD120 --zoom fill /home/pi/Pictures/your-images

✅ success seems to work - once retried after lot's of other things attempted

      # might need
      export DISPLAY=:0

#### Pi3D cause HEIC

- most of my photos will be HEIC so maybe I should use a viewer that supports
  that format out of the box

- via https://www.thedigitalpictureframe.com/the-heic-photo-format-now-works-with-the-pi3d-digital-picture-frame-image-viewer/

      sudo apt update && sudo apt upgrade -y
   
      # and
   
      sudo apt-get remove libde265-0 -y && \
        sudo apt-get remove libheif1 -y && \
        sudo apt-get remove libheif-dev -y && \
        sudo apt-get remove libde265-dev -y && \
        sudo apt install autotools-dev automake libtool texinfo x265 -y && \
        git clone https://github.com/strukturag/libde265.git && \
          cd libde265 && ./autogen.sh && ./configure --disable-dec265 --disable-sherlock265 --prefix /usr && \
          make && sudo make install && cd .. && \
        git clone https://github.com/strukturag/libheif.git && \
          cd libheif && ./autogen.sh && ./configure --prefix /usr && make && \
          sudo make install && cd .. && \
        git clone https://github.com/libffi/libffi.git && cd libffi && \
          ./autogen.sh && ./configure --prefix /usr && make && \
          sudo make install && cd .. && \
        pip3 install git+https://github.com/carsales/pyheif.git && \
          sudo pip3 install pyheif

- this `pyheif` should be able to convert HEIC to JPG???
- or use https://heictojpg.com/
- failed

      libheif/heif.h No such file or directory

- which does NOT actually install Pi3D
- https://www.thedigitalpictureframe.com/how-to-add-crossfading-slide-transitions-to-your-digital-picture-frame-using-pi3d/

      sudo raspi-config nonint do_boot_behaviour B4 && \
        sudo raspi-config nonint do_memory_split 128 && \
        sudo raspi-config 
   
      # go to 6 Advanced Options > A2 GL Driver > Choose G1 (Legacy)
      # message “The GL driver is disabled”. Click “OK”.
   
      pip3 install picframe
      sudo reboot
      picframe -i .
   
      picframe ~/picframe_data/config/configuration.yaml
   
      # error
      libEGL warning: DRI2: failed to authenticate
   
      # ❌ Failing here !!!

to create a service to run on startup

      mkdir ~/.config/systemd/user/ -p
   
      # and fill with
      cat >> ~/.config/systemd/user/picframe.service
      [Unit]
      Description=PictureFrame on Pi3
   
      [Service]
      ExecStart=/home/pi/.local/bin/picframe ~/picframe_data/config/configuration.yaml
      #Restart=always
   
      [Install]
      WantedBy=default.target
      ^D
   
      # chomd it
      sudo chmod 644 ~/.config/systemd/user/picframe.service
   
      # tell it to start at boot
      systemctl --user daemon-reload
      systemctl --user enable picframe.service
   
      # to stop/start/restart
      systemctl --user stop picframe.service
      systemctl --user start picframe.service
      systemctl --user restart picframe.service

#### TheDigitalPictureFrame.com

the hardware build using a real picture frame
- https://www.thedigitalpictureframe.com/how-to-build-a-digital-picture-frame-with-a-raspberry-pi/

the software install
- https://www.thedigitalpictureframe.com/how-to-set-up-your-raspberry-pi-for-your-digital-picture-frame/

      sudo raspi-config
      Under 2 Display Options – choose D4 Screen Blanking and disable it.

      # SMB setup - presumably to get to a network drive

      # potentially remove black border with
      sudo raspi-config nonint do_overscan 1

suggests to install the actual software
- https://www.thedigitalpictureframe.com/how-to-add-crossfading-slide-transitions-to-your-digital-picture-frame-using-pi3d/
  - which is **Pi3D cause HEIC** above and that fails

#### Raspberry Pi Photo Frame pimylifeup.com

- https://pimylifeup.com/raspberry-pi-photo-frame/

prevent screen from turning off with `lightdm.conf`

install feh

      sudo apt install feh

See **Feh** above?

but now it seems to install post the fixes above

and the run command recommended

    DISPLAY=:0.0 \
    XAUTHORITY=/home/pi/.Xauthority \
    /usr/bin/feh \
      --quiet \
      --preload \
      --randomize \
      --full-screen \
      --reload 60 -Y \
      --slideshow-delay 15.0 \
    /home/pi/Pictures

✅ success - although some images seem to be upside down

trying original

    feh -qrYzFD120 --zoom fill /home/pi/Pictures

also seems to work

has an autostart command? using the following

    cat > /home/pi/start-picture-frame.sh
    #!/bin/bash
    DISPLAY=:0.0 \
      XAUTHORITY=/home/pi/.Xauthority \
      /usr/bin/feh -q -p -Z -F -R  60 -Y -D 15.0 \
      /home/pi/Pictures

    # edit rc.local
    sudo vi /etc/rc.local

    # and add
    sleep 10
    bash /home/pi/start-picture-frame.sh &
    Unpacking feh (3.6.3-1) ...

need to test that

#### Fraymen

- photo app that plays photos from the cloud
- as per https://youtu.be/5HbAzWkHuZk
- but seems it is no longer avialable
  - https://www.thedigitalpictureframe.com/easiest-way-build-a-raspberry-pi-picture-frame-streaming-framen-photo-app/

#### Other

maybe some other ideas here
- https://www.makeuseof.com/tag/7-fabulous-raspberry-pi-picture-frame-projects/

using MagicMirror and NodeJS
- https://www.tomshardware.com/how-to/raspberry-pi-photo-frame

#### Next steps

- [ ] get more photos
- [ ] check it works after startup
- [ ] soak test it
- [ ] make it work on startup
- [ ] make sure the screen does not turn off

### Other Ras Pi projects

some interesting ones in here
- https://all3dp.com/1/best-raspberry-pi-projects/

this is an interesting page I think I have come across in the past
- https://geoffg.net/
