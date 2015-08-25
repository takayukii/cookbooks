applogs cookbook
==============

アプリケーションのログに対する設定を行う。

Requirements
------------

OpsWorksの下記の環境下で動作確認済

```
Operating System: Amazon Linux AMI release 2015.03
OpsWorks Layers: Node.js App Server
```

Attributes
----------

Attributesでは/var/log配下に作成するディレクトリ名を指定する

<table>
  <tr>
    <th>キー</th>
    <th>型</th>
    <th>説明</th>
    <th>初期値</th>
  </tr>
  <tr>
    <td><tt>['applogs']['paths']</tt></td>
    <td>配列</td>
    <td>ログディレクトリの絶対パスの配列</td>
    <td><tt>["/var/log/onecoindog"]</tt></td>
  </tr>
</table>

Usage
-----

#### applogs::default

* ["applogs"]["paths"]に指定されたディレクトリを作成する
* 各ディレクトリの*logに該当するファイルにlogrotateの設定を行う

なお、logrotateはcopytruncate（ログファイルを移動せずコピー後切り詰める）で処理しfluentdやpapertrailのようなログ監視ミドルウェアへの影響を抑えるように設定している。

```json
{
  "applogs": {
    "paths": ["/var/log/onecoindog"]
  }
}
```
