# rb2019

```
$ rackup -p 4567
```

```
docker build -f Dockerfile -t rb2019 .
docker run --env-file=.env -p 4568:4568 rb2019
```
