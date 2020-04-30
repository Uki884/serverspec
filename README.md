# 環境構築
## ruby実行環境構築
## serverspecインストール
```
bundle install #Gemfileがあるフォルダで実行
```
bundlerがない場合はgem install bundlerでグローバルにインストールする。


# 使い方
- configファイルを~/.ssh/配下に配置し、中身を編集する。

```
Host 3.112.131.83 #ホスト名 IPorDNS名で記載
  hostname 3.112.131.83 #IPorDNS名で記載
  user ec2-user #ログインユーザー指定。AmazonLinuxの場合はec2-user
  IdentityFile ~/.ssh/mf.pem #秘密鍵(pem)キーの置き場所指定
```
- properties/development.ymlを編集し接続先サーバを設定する。
```
sample:
  :roles: #記載したディレクトリ配下のspecファイルをすべて実行する。
    - common/
    - nginx/
    ...
  :hostname: 192.168.0.2 #接続先サーバ名orDNS名
```
- Serverspecテストを実行する。
```
rake serverspec:sample #ホスト名を指定した実行方法。個別に実行できる。
```
```
rake serverspec:all #properties/development.ymlに記載したすべてのホストでテストを実行
```
以下が出たら「ec2-user」と入力しユーザーを指定する。
```
SSHログインするユーザー名を入力してください: ec2-user
```
