# rb2019

```
$ rackup -p 4567
```

```
$(aws ecr get-login --no-include-email --region us-east-1 --profile ecr.user)
docker build -f Dockerfile -t rb2019 .
docker run --env-file=.env -p 4568:4568 rb2019
```
