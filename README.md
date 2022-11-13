# Overview

Docker image of `curl` compiled with `quictls/openssl`, `nghttp3`, and `ngtcp2` for **HTTP/3** request on `ubutun:18.04`.

Reference: https://github.com/curl/curl/blob/master/docs/HTTP3.md#ngtcp2-version

# How to Use

Let's call the HTTP/3 service via docker by

```shell
$ docker run -it --rm nguyenptk/curl-http3 curl -IL --http3 https://google.com

HTTP/3 301
location: https://www.google.com/
content-type: text/html; charset=UTF-8
date: Sun, 13 Nov 2022 14:34:43 GMT
expires: Tue, 13 Dec 2022 14:34:43 GMT
cache-control: public, max-age=2592000
server: gws
content-length: 220
x-xss-protection: 0
x-frame-options: SAMEORIGIN
alt-svc: h3=":443"; ma=2592000,h3-29=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"

HTTP/3 200
content-type: text/html; charset=ISO-8859-1
p3p: CP="This is not a P3P policy! See g.co/p3phelp for more info."
date: Sun, 13 Nov 2022 14:34:44 GMT
server: gws
x-xss-protection: 0
x-frame-options: SAMEORIGIN
expires: Sun, 13 Nov 2022 14:34:44 GMT
cache-control: private
set-cookie: 1P_JAR=2022-11-13-14; expires=Tue, 13-Dec-2022 14:34:44 GMT; path=/; domain=.google.com; Secure
set-cookie: AEC=AakniGNoht-qphZaCnffF8k6AniZDACkR0CMkM7qd5U5vddG7Cx_twTTuA; expires=Fri, 12-May-2023 14:34:44 GMT; path=/; domain=.google.com; Secure; HttpOnly; SameSite=lax
set-cookie: NID=511=bEGiBgKOUbpv7reEve346jkqMu6MTh1GqFfNoBsBAg97hlNgzlA-b57soRgouhkCbU2i1yIK832QbGoYuljU9EGjTuUovDIZiUZfeEG9FpEy7C14aoLsfTnUhT40p2zyLWUyTeVj1Nw0XlNs1SKb4nte-nd2f3fCs1J8nbA-Te4; expires=Mon, 15-May-2023 14:34:44 GMT; path=/; domain=.google.com; HttpOnly
alt-svc: h3=":443"; ma=2592000,h3-29=":443"; ma=2592000,h3-Q050=":443"; ma=2592000,h3-Q046=":443"; ma=2592000,h3-Q043=":443"; ma=2592000,quic=":443"; ma=2592000; v="46,43"
```
