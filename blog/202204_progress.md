# Progress Apr 2022

## Fri 1st Apr
  - track electricity meter https://www.mysensors.org/build/pulse_power
  - similar to
    - https://vestaaustralia.com.au/product/energy-meter-smart-reader-led-pulse-sensor/
  - example scripts for bin/bootstrap and bin/uninstall
    - https://github.com/hak5darren/wp6/blob/master/wp6.sh
    - https://github.com/Homebrew/install/blob/master/install.sh
  - what is https://k3s.io/ and how can I run on RasPi?
  - engineering ladders
    - CircleCI Engineering Competency Matrix
      - https://docs.google.com/spreadsheets/d/131XZCEb8LoXqy79WWrhCX4sBnGhCM1nAIz4feFZJsEo/edit#gid=0
    - etsy engineering career ladder
      - https://etsy.github.io/Etsy-Engineering-Career-Ladder/
    - Disco Engineering Career Framework
      - https://www.notion.so/Engineering-Career-Framework-7cab694bad474cbfa61926d76bc3e607
  - ANSI colours in shell
    - https://www.baeldung.com/linux/terminal-output-color
    ```
    #!/bin/sh
    RED_FG=`tput setaf 1`
    GREEN_BG=`tput setab 2`
    RESET=`tput sgr0`
    echo "${RED_FG}${GREEN_BG}Hello world${RESET}"

    MOVE_UP=`tput cuu 1`
    CLEAR_LINE=`tput el 1`
    BOLD=`tput bold`
    UNDERLINE=`tput smul`
    RESET=`tput sgr0`
    echo "This is normal text"
    sleep 1
    echo "${MOVE_UP}${CLEAR_LINE}${BOLD}This is bolded"
    sleep 1
    echo "${MOVE_UP}${CLEAR_LINE}${UNDERLINE}This is underlined${RESET}"
    ```
  - SD Card ESP based "recorder"
    - voice recorded?
    - file recorded? via web/bluetooth front end?
    - image file recorder? from camera? from web upload?
    - data tracker? bluetooth/wifi/location tracking?
    - as well as a super memory stick with multiple cards?
    - seems they can be hacked and have code execute on them, including simple
      tracking applications
      - https://www.bunniestudios.com/blog/?p=3554
    - covert data hiding device? in a rubiks cube :)
  - reading cards with arduino
    - https://werner.rothschopf.net/201703_arduino_esp8266_nfc.htm
  - next steps in sound app is to build a PWA - Progressive Web App
    - https://dev.to/100lvlmaster/create-a-pwa-with-sveltekit-svelte-a36
    - https://blog.logrocket.com/building-a-pwa-with-svelte/
  - some good books https://darknetdiaries.com/books/
  - what is https://pi-hole.net/
  - co-working to write more
    - https://jacobian.org/2021/mar/9/coworking-to-write-more/
  - Blynk-server and ESP8266
  - No Starch Press titles
    - The Hardware Hacking Handbook
      - https://nostarch.com/hardwarehacking
    - The Hardware Hacker (Paperback edition)
      - https://nostarch.com/hardwarehackerpaperback
    - The Art of Mac Malware
      - https://nostarch.com/art-mac-malware
    - Silence on the Wire
      - https://nostarch.com/silence.htm
    - Practical Social Engineering
      - https://nostarch.com/practical-social-engineering
    - Practical IoT Hacking
      - https://nostarch.com/practical-iot-hacking
    - Metasploit The Penetration Tester's Guide by David Kennedy, Jim O’Gorman,
      Devon Kearns, and Mati Aharoni
      - https://nostarch.com/metasploit
    - Malware Data Science Attack Detection and Attribution by Joshua Saxe with
      Hillary Sanders
      - https://nostarch.com/malwaredatascience
    - Go H\*ck Yourself A Simple Introduction to Cyber Attacks and Defense by
      Bryson Payne January 2022
      - https://nostarch.com/go-hck-yourself
    - Bug Bounty Bootcamp The Guide to Finding and Reporting Web
      Vulnerabilities by Vickie Li November 2021
      - https://nostarch.com/bug-bounty-bootcamp
    - Hacking APIs Breaking Web Application Programming Interfaces by Corey
      Ball May 2022
      - https://nostarch.com/hacking-apis
    - Locksport A Hackers Guide to Lock Picking, Impressioning, and Safe
      Cracking by Jos Weyers, Matt Burrough, Walter Belgers, BandEAtoZ, and
Nigel K. Tolley July 2023
      - https://nostarch.com/locksport
    - The Art of Cyberwarfare An Investigator's Guide to Espionage, Ransomware,
      and Organized Cybercrime by Jon DiMaggio March 2022
      - https://nostarch.com/art-cyberwarfare


