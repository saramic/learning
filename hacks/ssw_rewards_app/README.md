# NDC Sydney - (reverse of) sdraweR WSS

Love it when a company has a game to encourage some interaction

![get the app QR](
    images/get_the_app.jpg
)

which takes you to:

- http://onelink.to/4879xu
- and on a mobile redirects to app store
    - https://apps.apple.com/au/app/ssw-rewards/id1482994853

Once you have the app and are signed in you get points if you scan the QR of
various employees of the company

![QR of employee](
  images/in_app_user_qr.jpg
)

so why not connect with all the employees?

```javascript
open https://www.linkedin.com/company/ssw/people/

# and scroll to bottom to load all the employees

# in the console run some JS to extract the username and convert it to base64

members = Array.from(document.getElementsByClassName(
  'org-people-profile-card__profile-title'
)).map((e) => e.innerText)

distinct = [...new Set(members)]

distinct.map((name) => {
  try {
    return window.btoa(`ach:${name}`)
  } catch(error) { return `error ${name} with: ${error}` }
})
```

which returns

```
# full data in data.txt
[
    "YWNoOkFsZXggUm90aHdlbGw=",
    "YWNoOkx1a2UgUGFya2Vy",
    "YWNoOkJyYWR5IFN0cm91ZA==",
    ...
    "YWNoOnNzdyBybmQ=",
    "YWNoOkthdml0YSBTaGFybWE="
]
```

install some ruby gems

```
gem install rqrcode
gem install base64

# and create a ./qr_images/ directory
mkdir qr_images
```

and run the base64 text through a ruby script to generate QRCodes

```
# eithe recho the data directly
#   echo '[
#       "YWNoOkFsZXggUm90aHdlbGw=",
#       "YWNoOkx1a2UgUGFya2Vy",
#       "YWNoOkJyYWR5IFN0cm91ZA==",
#       ...
#       "YWNoOnNzdyBybmQ=",
#       "YWNoOkthdml0YSBTaGFybWE="
#   ]' | ruby -e ' \
#     ...

# or just cat the data.txt file
cat data.txt | ruby -e ' \
require "rqrcode"; require "base64"; data =  $stdin.read; \
members = eval(data); \
members.each{|base64_name| \
  qrcode = RQRCode::QRCode.new(base64_name); \
  png = qrcode.as_png(size: 300); \
  IO.binwrite("qr_images/ach_#{base64_name}.png", png.to_s)}'
```

finally open the images and scan them

```
open qr_iamages
```

