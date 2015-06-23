---
layout: article_layout
title: 初心者がDockerに入門してみた
date: 2015-06-09 21:00 JST
author: くにちゃん
description: 初心者がDockerに入門してみた話．
keywords: Docker,Linux
eyecatch: https://dit-rohm.com/blog/2015-06-09/docker.png
tags:
---

# 初心者がDockerに入門してみた

こんにちは，DITメンターのくにちゃんです．
「コンテナ」という言葉がバズってからかなりの月日が経ち，
今更感が拭えないものの[Docker](https://www.docker.com/ "Docker")に入門することにしました．

![この物語は、Docker初心者の平凡な日常を淡々と描く物です。過度な期待はしないでください。](./2015-06-09/minamike.png)

## Try It!

[![Docker](./2015-06-09/docker.png)](https://www.docker.com/)

物は試しに，公式サイトに用意されているオンラインチュートリアルを一通り通すことにしました．

ちなみにDockerはGo言語で書かれています．
バージョン表示からもGo言語が使用されていることをうかがい知ることが出来ます．
なお，執筆時の最新バージョンはDockerが1.6.2，Goが1.4.2です．

```bash
you@tutorial:~$ docker version
Docker Emulator version 0.1.3

Emulating:
Client version: 0.5.3
Server version: 0.5.3
Go version: go1.1
```

[![Docker Hub](./2015-06-09/docker-hub.png)](https://hub.docker.com/)

Dockerのイメージファイルは[Docker Hub](https://hub.docker.com/)というサービスで共有することが出来ます．
DebianやCentOSなどのディストリビューションのイメージ，MongoDBやPostgreSQLなどのミドルウェアのイメージも共有されており，
ウェブブラウザもしくは```docker search```でイメージを検索することが出来ます．
GitHubライクにコンテナイメージを共有することが出来て便利ですね．

```bash
you@tutorial:~$ docker search tutorial
Found 1 results matching your query ("tutorial")
NAME                      DESCRIPTION
learn/tutorial            An image for the interactive tutorial
```

```docker pull```でDocker Hubにpushされたイメージをローカルに取得することが出来ます．

```bash
you@tutorial:~$ docker pull learn/tutorial
Pulling repository learn/tutorial from https://index.docker.io/v1
Pulling image 8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c (precise) from ubuntu
Pulling image b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc (12.10) from ubuntu
Pulling image 27cf784147099545 () from tutorial
```

```docker run```を使用することで```docker pull```したイメージからコンテナを生成，コンテナ内でコマンドを実行することが出来ます．
名言を表示させてみましょう．

```bash
you@tutorial:~$ docker run learn/tutorial echo "金は命より重い そこの認識をごまかす輩は生涯地を這う"
金は命より重い そこの認識をごまかす輩は生涯地を這う
```

さて，次に```apt-get install -y ping```を実行してpingを使用できるようにします．
どうやらこのコンテナのbase imageはDebian系のディストリビューションのようです．

```bash
you@tutorial:~$ docker run learn/tutorial apt-get install -y ping
Reading package lists...
Building dependency tree...
The following NEW packages will be installed:
  iputils-ping
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 56.1 kB of archives.
After this operation, 143 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu/ precise/main iputils-ping amd64 3:20101006-1ubuntu1 [56.1 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 56.1 kB in 1s (50.3 kB/s)
Selecting previously unselected package iputils-ping.
(Reading database ... 7545 files and directories currently installed.)
Unpacking iputils-ping (from .../iputils-ping_3%3a20101006-1ubuntu1_amd64.deb) ...
Setting up iputils-ping (3:20101006-1ubuntu1) ...
```

```docker ps -l```を使用することで生成されたコンテナの一覧を得ることが出来ます．

```bash
you@tutorial:~$ docker ps -l
ID                  IMAGE               COMMAND                CREATED             STATUS              PORTS
6982a9948422        ubuntu:12.04        apt-get install ping   1 minute ago        Exit 0
```

コンテナ内のデータはcommitするか，外部に保存するかしない限り永続化されません．
ホストのディレクトリもしくはファイルをコンテナ内にマウントしたり，データ格納専用のコンテナを用意してコンテナ内にマウントすることも出来ます．

今回は```docker commit```して```apt-get install -y ping```で加えられた変更を永続化しましょう．

```bash
you@tutorial:~$ docker commit 698 learn/ping
effb66b31edb
```

先にインストールしたpingコマンドを使用してwww.google.comにpingをうってみます．

```bash
you@tutorial:~$ docker run learn/ping ping www.google.com
PING www.google.com (74.125.239.129) 56(84) bytes of data.
64 bytes from nuq05s02-in-f20.1e100.net (74.125.239.148): icmp_req=1 ttl=55 time=2.23 ms
64 bytes from nuq05s02-in-f20.1e100.net (74.125.239.148): icmp_req=2 ttl=55 time=2.30 ms
64 bytes from nuq05s02-in-f20.1e100.net (74.125.239.148): icmp_req=3 ttl=55 time=2.27 ms
64 bytes from nuq05s02-in-f20.1e100.net (74.125.239.148): icmp_req=4 ttl=55 time=2.30 ms
64 bytes from nuq05s02-in-f20.1e100.net (74.125.239.148): icmp_req=5 ttl=55 time=2.25 ms
64 bytes from nuq05s02-in-f20.1e100.net (74.125.239.148): icmp_req=6 ttl=55 time=2.29 ms
64 bytes from nuq05s02-in-f20.1e100.net (74.125.239.148): icmp_req=7 ttl=55 time=2.23 ms
64 bytes from nuq05s02-in-f20.1e100.net (74.125.239.148): icmp_req=8 ttl=55 time=2.30 ms
64 bytes from nuq05s02-in-f20.1e100.net (74.125.239.148): icmp_req=9 ttl=55 time=2.35 ms
-> This would normally just keep going. However, this emulator does not support Ctrl-C, so we quit here.
```

最後にDocker Hubへイメージをpushします．

```bash
you@tutorial:~$ docker push learn/ping
The push refers to a repository [learn/ping] (len: 1)
Processing checksums
Sending image list
Pushing repository learn/ping (1 tags)
Pushing 8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c
Image 8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c already pushed, skipping
Pushing tags for rev [8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c] on {https://registry-1.docker.io/v1/repositories/learn/ping/tags/latest}
Pushing a1dbb48ce764c6651f5af98b46ed052a5f751233d731b645a6c57f91a4cb7158
Pushing  11.5 MB/11.5 MB (100%)
Pushing tags for rev [a1dbb48ce764c6651f5af98b46ed052a5f751233d731b645a6c57f91a4cb7158] on {https://registry-1.docker.io/v1/repositories/learn/ping/tags/latest}
```

## Dockerfile
Dockerfileというテキストファイルに操作を記述することで，Dockerにイメージを自動的に生成させることが出来ます．
本節で使用する命令は以下の通りです．

 * FROM：base imageを指定
 * MAINTAINER：コンテナのAuthorフィールドに格納される値を指定
 * RUN：docker buildで実行するコマンドを指定
 * WORKDIR：作業ディレクトリを変更
 * ENTRYPOINT：コンテナがdocker runされた時に実行するコマンドを指定

それでは，dit-rohm.comのリポジトリをcloneして，実行環境を整えた状態のイメージを生成するDockerfileを作成してみましょう．
base imageにはdebian:jessieを採用します．

```bash
$ cat Dockerfile
FROM debian:jessie

MAINTAINER Draco Malfoy, draco@malfoyfoy.me

RUN echo "deb http://ftp.jp.debian.org/debian jessie main contrib non-free" > /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get clean

RUN apt-get install -y git ruby ruby-dev nodejs nodejs-legacy npm && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN gem install bundler
RUN npm -g install bower

RUN git clone https://github.com/dit-rohm/dit-rohm.com.git
WORKDIR dit-rohm.com
RUN bundle install --path vendor/bundle
RUN bower install --config.interactive=false --allow-root

ENTRYPOINT bundle exec middleman server
```

次にイメージのbuildを行います．
Dockerfileに書いたコマンドが一行毎に実行されていることが分かります．

```bash
$ docker build .
Sending build context to Docker daemon  2.56 kB
Sending build context to Docker daemon
Step 0 : FROM debian:jessie
 ---> df2a0347c9d0
Step 1 : MAINTAINER Draco Malfoy, draco@malfoyfoy.me
 ---> Using cache
 ---> e2c54581b168
Step 2 : RUN echo "deb http://ftp.jp.debian.org/debian jessie main contrib non-free" > /etc/apt/sources.list
 ---> Using cache
 ---> 8f6ee7fde25c
Step 3 : RUN apt-get update && apt-get upgrade -y && apt-get clean
 ---> Using cache
 ---> 272c1f51a5d4
Step 4 : RUN apt-get install -y git ruby ruby-dev nodejs nodejs-legacy npm && apt-get clean && rm -rf /var/lib/apt/lists/*
 ---> Using cache
 ---> 6fe07ad84795
Step 5 : RUN gem install bundler
 ---> Using cache
 ---> 7f27a0c57c93
Step 6 : RUN npm -g install bower
 ---> Using cache
 ---> c9412562d3a6
Step 7 : RUN git clone https://github.com/dit-rohm/dit-rohm.com.git
 ---> Using cache
 ---> 6ffc01e222ea
Step 8 : WORKDIR dit-rohm.com
 ---> Using cache
 ---> de0f8ce67d15
Step 9 : RUN bundle install --path vendor/bundle
 ---> Using cache
 ---> 904d0a7152f6
Step 10 : RUN bower install --config.interactive=false --allow-root
 ---> Using cache
 ---> fe135566cbdf
Step 11 : ENTRYPOINT bundle exec middleman server
 ---> Using cache
 ---> 88076cc521f4
Successfully built 88076cc521f4
```

上記の出力例では事前に```docker build .```していたので，キャッシュを使用してイメージがビルドされました．

次に生成されたイメージからコンテナを生成してバックグラウンドで実行します．
--net hostを指定することでコンテナ内のプロセスからホストのネットワークスタックを利用出るようにしています．また，-dを指定することでコンテナをバックグラウンドで実行します．

```bash
$ docker run --net host -d 88076cc521f4
f7c62ed6a238d71fadd02dc8c63e77f234e55c44305c335275aebec325e75c21
```

最後にcURLで疎通確認を行います．
以下の出力例では```<title>```タグのある行のみを抽出して表示されました．
少なくともトップページのHTMLが出力されることを確認できました．

```bash
$ curl -s http://localhost:4567/ | grep '<title>'
  <title>DIT</title>
```

以上がDockerfileからDockerコンテナのイメージをビルドするまでの流れになります．

## 参考文献
* [Online Tutorial - Try It! | Docker](https://www.docker.com/tryit/)
* [いまさら聞けないDocker入門（1）：アプリ開発者もインフラ管理者も知っておきたいDockerの基礎知識 - ＠IT](http://www.atmarkit.co.jp/ait/articles/1405/16/news032.html)
* [VagrantとDockerについて名前しか知らなかったので試した - Qiita](http://qiita.com/hidekuro/items/fc12344d36d996198e96)
* [DockerのHost networking機能 | SOTA](http://deeeet.com/writing/2014/05/11/docker-host-networking/)
* [Dockerfile - Docker Documentation](http://docs.docker.com/reference/builder/)
