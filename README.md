# vimdock

ポータブルなvim開発環境を目指しているもの。

## 動作要件

多分この辺が必要。バージョンは最新を推奨。

- docker
- docker-compose

## インストール

インストールする程でもないけど、`git clone`するだけ。

```
git clone --depth 1 git@github.com:sameyasu/vimdock.git vimdock
```

## 使い方

vimdockをcloneしたディレクトリに移動して、`login.sh`を実行するだけ。

```
cd vimdock
./login.sh
```

初回起動時にdockerイメージのダウンロードとビルドが実行されます。
２回目以降はビルドが不要なのですぐに使えます。

## カスタマイズ

vimrcなどをいじりたければ、リポジトリをforkして`docker/vimrc`ファイルをいじれば良いと思います。
