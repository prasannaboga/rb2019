# rb2019

##### FIXME
- [ ]

##### Start Server
```
$ bundle exec puma -p 7001
```

##### Docker Commands
```
$(aws ecr get-login --no-include-email --region us-east-1 --profile ecr.user)
docker build -f Dockerfile -t rb2019 .
docker run --env-file=.env -p 7001:7001 rb2019
```

##### Notes

- Can't run the server in 6000 port. Ref - https://chromium.googlesource.com/chromium/src.git/+/refs/heads/master/net/base/port_util.cc#23
