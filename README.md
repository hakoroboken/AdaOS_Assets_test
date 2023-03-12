# AdaOS_Assets_test

## インストール
ベースのイメージを作成する。
```shell
git clone https://github.com/hakoroboken/AdaOS_Assets_test.git
cd AdaOS_Assets_test
chmod +x ./scripts/*.sh
./scripts/make_base_image.sh
```

## ワークスペースの作成
```
cd <任意の場所>
wget -q https://raw.githubusercontent.com/hakoroboken/AdaOS_Assets_test/main/scripts/make_pkg_ws.sh && chmod +x ./*.sh
```

- git レポジトリがある場合
```shell
./make_pkg_ws.sh <git_link>
```
- 複数 git レポジトリがある場合
```shell
./make_pkg_ws.sh <git_link> <git_link> <git_link> <git_link>
```

- プロジェクトを自分で追加する場合
```shell
./make_pkg_ws.sh -d <適当な名前>
```
ワークスペースの中にあるsrcフォルダにプロジェクトを入れる

## パッケージ内包コンテナの作成
```shell
cd <生成されたワークスペース>
./scripts/make_pkg_image.sh <コンテナ名>:<タグ名>
```

## 実行

`launch/<ワークスペース名>.adaos-exe.py`にros launchファイルの内容を書き込む

```shell
./scripts/launch.sh <コンテナ名>:<タグ名>
```
