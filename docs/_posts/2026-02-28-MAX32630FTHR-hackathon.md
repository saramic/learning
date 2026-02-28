---
layout: post
title:  "MAX32630FTHR hackaton"
date:   2026-02-28 18:00:00 +1100
categories: electronics, hackaton
---

# Element14 Design challeng

[https://community.element14.com/challenges-projects/design-challenges/smart-security-and-surveillance/dc/dc/81/smart_security_and_s](
https://community.element14.com/challenges-projects/design-challenges/smart-security-and-surveillance/dc/dc/81/smart_security_and_s)

using the device [https://os.mbed.com/platforms/MAX32630FTHR/](
https://os.mbed.com/platforms/MAX32630FTHR/)

after a bunch of prompting, this was AI suggested as a winning entry

> **VolkWatch** — AI-Powered Wildlife vs Human Intruder Perimeter Sentry
>
> Project Description
>
> **VolkWatch** is an AI-enabled smart perimeter sentinel designed for remote
> outdoor environments such as campsites, scout jamborees, conservation zones,
> and rural properties. Its purpose is to distinguish between natural wildlife
> activity and genuine human intrusions using on-device machine learning models
> running at the edge on the Analog Devices MAX32630FTHR platform. Traditional
> motion sensors often generate nuisance alarms from animals or environmental
> noise, reducing trust in security alerts; VolkWatch solves this by combining
> multi-sensor data (acoustic signatures, motion patterns, vibration features,
> and radio spectrum analysis) to make real-time, confidence-based
> classifications without relying on cloud connectivity.
>
> Leveraging TinyML techniques and TensorFlow Lite Micro, VolkWatch extracts
> spectral and temporal features from ambient sound and motion in real time,
> feeding them into a compact neural network that classifies events as Human,
> Animal, or Noise/Environment. The system wakes from low-power sleep only when
> significant events are detected, maximizing battery life for extended remote
> deployment. Upon classification of a human intrusion, the node triggers local
> alerts (LED, buzzer) and can optionally transmit secure notifications via
> low-power wireless (e.g., LoRa or BLE), making it suitable even in
> low-connectivity environments.
> 
> This project will fully utilize features of the MAX32630FTHR kit — including
> its low-power Cortex-M4F MCU, audio sampling, sensor inputs, and display
> modules — to demonstrate an effective AI-at-the-edge security prototype. The
> build log will cover requirements analysis, sensor integration, embedded
> TinyML model training and optimization, hardware prototyping, firmware
> design, and real-world testing under outdoor conditions.

## Getting the MAX32630FTHR

- [https://octopart.com/part/analog-devices/MAX32630FTHR%23](
  https://octopart.com/part/analog-devices/MAX32630FTHR%23)
    - [Digikey](https://www.digikey.com.au/en/products/detail/analog-devices-inc-maxim-integrated/MAX32630FTHR/6575544)
        - $60.92
    - [Element14](https://au.element14.com/analog-devices/max32630fthr/pegasus-dev-brd-batt-optimized/dp/2723406)
        - $70.884 (inc GST)
    - [https://www.flywing-tech.com/product-detail/evaluation-boards-embedded-mcu-dsp-maxim-integrated-max32630fthr-8d216212](
      https://www.flywing-tech.com/product-detail/evaluation-boards-embedded-mcu-dsp-maxim-integrated-max32630fthr-8d216212)
        - USD $28.82
    - [https://www.bettlink.com/product/analogdevicesincmaximintegrated-max32630fthr-8834365](
      https://www.bettlink.com/product/analogdevicesincmaximintegrated-max32630fthr-8834365)
        - USD $31.16
    - [https://uk.farnell.com/analog-devices/max32630fthr/pegasus-dev-brd-batt-optimized/dp/2723406](
      https://uk.farnell.com/analog-devices/max32630fthr/pegasus-dev-brd-batt-optimized/dp/2723406)
        - £28.540 (ex VAT)

- [AnalogDevices](https://au.mouser.com/new/analog-devices/maxim-max32630fthr-pegasus-platform)
    - ???
- [EBay](https://www.ebay.com/itm/276807336322)
    - USD $29.99

## Sensors

- AMG8833 IR Infrared Sensor
  - [https://www.aliexpress.com/item/1005004932931593.html](
    https://www.aliexpress.com/item/1005004932931593.html)
  - $26
- Adaruit AMG8833 IR [core-electronics](https://core-electronics.com.au/adafruit-amg8833-ir-thermal-camera-breakout.html)
    - $84.10
  - [https://core-electronics.com.au/sparkfun-grid-eye-infrared-array-breakout-amg8833-qwiic.html](
    https://core-electronics.com.au/sparkfun-grid-eye-infrared-array-breakout-amg8833-qwiic.html)
