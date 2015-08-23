applog Cookbook
==============
/var/log配下に app_name でディレクトリを作成しlogrotateの設定を行う。logrotateはcopytruncate（ログファイルを移動せずコピー後切り詰める）で処理しfluentdやpapertrailのようなログ監視のミドルウェアへの影響を抑える。

Requirements
------------
OpsWorksの下記の環境下で動作確認済

Operating System: Amazon Linux AMI release 2015.03
OpsWorks Layers: Node.js App Server

Attributes
----------

Attributesでは/var/log配下に作成するディレクトリ名を指定する

e.g.
#### applog::default
<table>
  <tr>
    <th>キー</th>
    <th>型</th>
    <th>説明</th>
    <th>初期値</th>
  </tr>
  <tr>
    <td><tt>['applog']['app_name']</tt></td>
    <td>文字列</td>
    <td>アプリケーションの名称</td>
    <td><tt>onecoindog</tt></td>
  </tr>
</table>

Usage
-----

#### nodeproxy::default

OpsWorksのCustom JSONでは必要に応じて下記のように指定する（StackのSettingsより設定可能）

```json
{
  "applog": {
    "app_name": "onecoindog"
  }
}
```
