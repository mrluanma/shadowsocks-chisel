shadowsocks-chisel
==================

[shadowsocks](https://github.com/shadowsocks/shadowsocks-go) + [chisel](https://github.com/jpillora/chisel) = ❤❤

### Getting started

Make sure you have a working Docker installation (eg. `docker ps`) and that you’re logged in to Heroku (`heroku login`).

Log in to Container Registry:

```
$ heroku container:login
```

Create a Heroku app:

```
$ heroku create
Creating app... done, ⬢ stormy-castle-77230
https://stormy-castle-77230.herokuapp.com/ | https://git.heroku.com/stormy-castle-77230.git
```

Set `CHISEL_AUTH`, `METHOD`, `KEY` config:

```
$ heroku config:set CHISEL_AUTH=user:pass METHOD=rc4-md5 KEY=foobar
Setting CHISEL_AUTH, METHOD, KEY and restarting ⬢ stormy-castle-77230... done, v3
CHISEL_AUTH: user:pass
KEY:         foobar
METHOD:      rc4-md5
```

Build the image and push to Container Registry:

```
$ heroku container:push web
```

Connect your `chisel` client:

```
$ chisel client --auth user:pass --keepalive 50s https://stormy-castle-77230.herokuapp.com 8388
2018/01/09 00:46:14 client: Connecting to wss://stormy-castle-77230.herokuapp.com:443
2018/01/09 00:46:14 client: tunnel#1 0.0.0.0:8388=>0.0.0.0:8388: Listening
2018/01/09 00:46:16 client: Fingerprint c9:a3:f1:ad:fd:52:7f:8e:9b:92:c1:40:2e:79:44:ce
2018/01/09 00:46:18 client: Connected (Latency 300.439478ms)
```

Run `shadowsocks-local`:

```
$ shadowsocks-local -s 127.0.0.1 -p 8388 -m rc4-md5 -k foobar -l 1080
2018/01/09 00:51:32 available remote server 127.0.0.1:8388
2018/01/09 00:51:32 starting local socks5 server at :1080 ...
```

Point your SOCKS5 clients to `127.0.0.1:1080`

```
$ curl --socks5 127.0.0.1:1080 ifconfig.co
54.204.99.36
```
