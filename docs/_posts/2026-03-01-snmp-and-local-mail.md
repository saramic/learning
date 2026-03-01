---
layout: post
title:  "SNMP and sending localhost mails"
date:   2026-03-01 19:00:00 +1100
categories: SNMP, hakcing, mail
---

# SNMP and sending localhost mails

To just run a local catch all server:

```sh
docker run --rm -p 1025:1025 -p 8025:8025 mailhog/mailhog
```

to send an email

```sh
brew install swaks

# with default test subject and body
swaks --server localhost --port 1025 \
  --to saramic@gmail.com
```

these can be viewd in the mailhog browser view

```sh
open http://0.0.0.0:8025
```

To send real email, you would need something like a postfix relay? in the
example below you could optionally limit to a set of sender domains with

`  -e ALLOWED_SENDER_DOMAINS="<YOUR_DOMAIN.COM>" \`

```sh
docker run -d \
  --name postfix-relay \
  -p 2525:25 \
  -e POSTFIX_myhostname="mail.milander.net" \
  -e POSTFIX_smtp_helo_name="mail.milander.net" \
  -e POSTFIX_mynetworks="127.0.0.0/8,172.16.0.0/12,192.168.0.0/16,10.0.0.0/8" \
  -e POSTFIX_smtpd_relay_restrictions="permit_mynetworks,reject_unauth_destination" \
  -e ALLOW_EMPTY_SENDER_DOMAINS=1 \
  boky/postfix

# at the end to remove the docker container
docker rm -f postfix-relay
```

now to send an email you can use the same `swaks` command or add a custom
`header` and `body` as below and even add some `From: ` headers to change who
the email looks like it is coming from.

```sh
swaks \
  --to <SOME_REAL@EMAIL.COM> \
  --from <THE_REAL@FROM_EMAIL> \
  --header 'From: "YOUR FAKE NAME" < <YOUR_FAKE@EMAIL.COM> >' \
  --header 'Subject: THE SUBJCET' \
  --body 'THE BODY' \
  --server localhost --port 2525
```

looking at the server you can look at the logs

```sh
docker logs -f postfix-relay
```

where a successfull send would look like this, in this case using a fake
`FROM_FAKE_EMAIL@ADDRESS.COM` and sending it to a `REAL_EMAIL@ADDRESS.COM` on
`mx1.dreamhost.com`

```log
2026-03-01T08:24:13.814711+00:00 INFO
    postfix/qmgr[994]: C61FB452021: from=< <FROM_FAKE_EMAIL@ADDRESS.COM> >,
    size=544, nrcpt=1 (queue active)
2026-03-01T08:24:13.815065+00:00 INFO
    postfix/smtpd[1398]: disconnect from unknown[172.17.0.1] ehlo=1 mail=1
    rcpt=1 data=1 quit=1 commands=5
2026-03-01T08:24:18.279605+00:00 INFO
    postfix/smtp[1402]: C61FB452021: to=< <REAL_EMAIL@ADDRESS.COM> >,
    relay=mx1.dreamhost.com[64.90.62.163]:25, delay=4.5,
    delays=0.03/0/3.8/0.65, dsn=2.0.0, status=sent (250 2.0.0 Ok: queued as
    4fNw8K693Wz7PJ9)
2026-03-01T08:24:18.280615+00:00 INFO
    postfix/qmgr[994]: C61FB452021: removed
```

and if the upstream mail server rejcets you, in this case as your residentiall
IP address is on the `spamhaus.org` list of blocked IP addresses, it may look
like this

```log
2026-03-01T08:23:45.993782+00:00 INFO
    postfix/qmgr[994]: F0DAD452021: from=< <FROM_EMAIL@ADDRESS.COM> >, size=586,
    nrcpt=1 (queue active)
2026-03-01T08:23:46.797353+00:00
    INFO postfix/smtp[1402]: F0DAD452021: to=< <TO_EMAIL@ADDRESS.COM> >, relay=
    <UPSTREAM_RELAY AND IP >, delay=0.91, delays=0.11/0.02/0.73/0.06,
    dsn=5.7.1, status=bounced (host <UPSTREAM_RELAY AND IP > said: 550 5.7.1
    Service unavailable, Client host [ <SENDING_IP_ADDRESS> ] blocked using
    Spamhaus. To request removal from this list see
    https://www.spamhaus.org/query/ip/<SENDING_IP_ADDRESS> AS(1450)
    [ML1PEPF0001130A.ausprd01.prod.outlook.com 2026-03-01T08:23:46.760Z
    08DE7566F2DB722E] (in reply to RCPT TO command))
2026-03-01T08:23:46.823713+00:00 INFO
    postfix/bounce[1403]: F0DAD452021: sender non-delivery notification:
    C8D02452025
2026-03-01T08:23:46.823900+00:00 INFO
    postfix/qmgr[994]: F0DAD452021: removed
```

To manually connect and send an email you can

```sh
telnet localhost 2525
```

```sh
EHLO test
MAIL FROM:<VALID_FROM@ADDRESS.COM>
RCPT TO:<VALID_TO@ADDRESS.COM>
DATA
Subject: test

Hello world
.
QUIT
```

Other protection mechanisms include

- `IP` reputation (historical behavior)
- Domain reputation
- `SPF` alignment
- `DKIM` signature validity
- `DMARC` alignment
- Reverse `DNS`
- `HELO` consistency
- `TLS` usage
- Sending volume patterns
- User engagement (opens, deletes, spam clicks)
- Content signals
- `URL` reputation
- Behavioral patterns

