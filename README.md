# peercast-docker

オリジナルPeerCast の Docker コンテナで、svn20080104パッチを当てたもの[^package]をビルドしたものです。

[^package]: [Ubuntuのパッケージです](https://launchpad.net/ubuntu/+source/peercast/0.1218+svn20080104-1.1)

### Dockerhub
[Docker hub meto4d/peercast-orig](https://hub.docker.com/r/meto4d/peercast-orig/)へimageを上げています。

# 利用方法

imageをpullしてdocker runだけで利用することができます。

    $ docker run -p 7144:7144 meto4d/peercast-orig:latest

# その他

### 初期設定項目について
デフォルト設定から変更された設定ファイルが導入されています。
- 初期パスワード：peercast
