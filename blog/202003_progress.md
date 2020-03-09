# Progress Feb 2020

* Tue 10th
  yesterday played with ESP32 and arduino
  - bought [ESP32 Main Board with WiFi and Bluetooth](https://www.jaycar.com.au/esp32-main-board-with-wifi-and-bluetooth-communication/p/XC3800)
  - tried to connect to Arduino software
  - followed instructions from Jaycar https://www.jaycar.com.au/medias/sys_master/images/9357969752094/XC3800-manualMain.pdf
  - needed to add to baord managers in Arduino -> settings https://github.com/espressif/arduino-esp32/blob/master/README.md#installation-instructions
  - then installed the boar manager
  - which means ESP32 comes up in menu
  - but cannot find serial
  - downlaod and install the serial driver https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers
  - now can connect but blink does not work
  - tried Arduino pin 7 nothing
  - ESP 32 pin is 2 still nothing
  - worked out the red light is power and there is NO onboard LED that can be
    controlled
  - confirmed in this blog http://reefwingrobotics.blogspot.com/2018/07/espressif-esp32-tutorial-programming.html
  - uploaded a sketch that talked serial and saw it worked as got messages on serial monitor
  Next steps:
  - [ ] hook up to wifi
  - [ ] hook up to bluetooth
  - [ ] configure via bluetooth
  - [ ] can I interogate a serial port from a set of scales and broadcast that
    data somewhere that can be captured by a website? PubNub chat style?
