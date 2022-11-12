# This repository is archived

現状作者はこのツールに頼らなければならないほど大規模に運用しておらず、メンテナンスできていないため、アーカイブしました。

-----------------

# Apple Developer Program Utilities

Apple Developer Progaram の各種作業をサポートするツール。

## 共通

環境変数に `ADP_LOGIN_USER` `ADP_LOGIN_PASSWORD` もしくは `ADP_LOGIN` (メールアドレスとパスワードを `:` で接続したもの)が定義されていない場合は、pit でメールアドレスとパスワードを入力するようになっている。

-t で Team ID を指定しなかった場合は Spaceship のチーム選択ダイアログが実行される。

## repair_profiles

破損したプロビジョニングプロファイルを再生成する。

```
repair_profiles [-t TEAM_ID] [profile_name] ...
```

以下の状態にあるプロファイルを破損として取り扱う。

- Invalid になっているもの
- プロファイルに対して登録できる証明書がすべて有効になっていないもの
- プロファイルに対して登録できる UDID がすべて有効になっていないもの

破損したプロファイルに対しては、登録できる証明書と UDID をすべて登録した状態で再発行する。

`profile_name` を指定すると、その名前のプロファイルのみを対象にできる。

## redownload_profiles

指定した名前のプロビジョニングプロファイルをダウンロードし、決まった場所に配備する。

```
redownload_profiles [-t TEAM_ID] [profile_name] ...
```

指定した名前のプロビジョニングプロファイルがすでに存在している場合はすべて削除する。

## sync\_deploygate_devices

DeployGate の登録リクエストに上がってきている端末を Apple Developer Program に登録する。

```
sync_deploygate_devices [-t TEAM_ID] [-u DEPLOYGATE_USER_ID] [-k DEPLOYGATE_API_TOKEN] [-n PREFIX] -i bundle_id 
```

- -u は `DEPLOYGATE_USER` と -k は `DEPLOYGATE_API_KEY` をそれぞれ環境変数で指定することで省略できる。
- -n に ADP 登録名のプレフィクスを指定することができる。



## License

MIT
