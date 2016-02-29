# ghi-docker

Docker container for [github command line client](https://github.com/stephencelis/ghi/) following 
[installation instructions](https://github.com/stephencelis/ghi/blob/master/README.md#install), using Ruby.

```
docker pull antonmry/ghi-docker
```

## Usage

```
docker run -i -t --rm -v $HOME:/home/ghi antonmry/ghi-docker [command]
```

```
$ docker run --rm -v $HOME:/home/ghi antonmry/ghi-docker -v
ghi version 1.1.1
```

### Detailed Example

```
$ alias ghi='docker run -i -t --rm -v $HOME:/home/ghi antonmry/ghi-docker'
$ ghi config --auth YOUR_GITHUB_USER
Enter antonmry's GitHub password (never stored):     ✔
Two-factor authentication code: 046474
which: no security in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin)
Your ~/.gitconfig has been modified by way of:

  git config --global ghi.token secret_token 

Do not check this change into public source control!

You can increase security by storing the token in a secure place that can be
fetched from the command line. E.g., on OS X:

  git config --global ghi.token \
    "!security -a YOUR_GITHUB_USER -s github.com -l 'ghi token' -w"

Alternatively, set the following env var in a private dotfile:

  export GHI_TOKEN="secret_token"

$ ghi list 

```

### Note

To avoid **Usage of loopback devices is strongly discouraged for production use. Either use `--storage-opt dm.thinpooldev` or use `--storage-opt dm.no_warn_on_loop_devices=true` to suppress this warning.**

```
$ vi /etc/sysconfig/docker-storage

DOCKER_STORAGE_OPTIONS="--storage-opt dm.no_warn_on_loop_devices=true"
```