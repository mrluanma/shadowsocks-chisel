shadowsocks-chisel
==================

[shadowsocks](https://github.com/shadowsocks/shadowsocks-go) + [chisel](https://github.com/jpillora/chisel) = ❤❤

### Getting started

Use this button [![Heroku Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/mrluanma/shadowsocks-chisel)

Or create a Heroku app manually:

```
$ heroku create
$ heroku stack:set container
$ heroku config:set CHISEL_AUTH=user:pass METHOD=rc4-md5 KEY=foobar
$ git push heroku master
...
remote: Verifying deploy... done.
To https://git.heroku.com/damp-anchorage-82986.git
 * [new branch]      master -> master
```

Connect your `chisel` client:

```
$ chisel client --auth user:pass --keepalive 50s https://damp-anchorage-82986.herokuapp.com 8388
2019/04/15 17:58:45 client: Connecting to wss://damp-anchorage-82986.herokuapp.com:443
2019/04/15 17:58:45 client: proxy#1:0.0.0.0:8388=>0.0.0.0:8388: Listening
2019/04/15 17:58:48 client: Fingerprint 86:20:15:f6:83:36:b4:90:c9:97:8b:6a:ca:9a:43:92
2019/04/15 17:58:50 client: Connected (Latency 471.311085ms)
```

Run `shadowsocks-local`:

```
$ shadowsocks-local -s 127.0.0.1 -p 8388 -m rc4-md5 -k foobar -l 1080
2019/04/15 17:59:35 available remote server 127.0.0.1:8388
2019/04/15 17:59:35 starting local socks5 server at :1080 ...
```

Point your SOCKS5 clients to `127.0.0.1:1080`

```
$ curl --socks5 127.0.0.1:1080 ifconfig.co
54.204.99.36
```
