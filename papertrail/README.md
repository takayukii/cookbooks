papertrail cookbook
==============
papertrailでログを転送するremote_syslogを導入する。過去に利用した事があるElastic Beanstalk用のスクリプトを参考に作成した。
https://gist.github.com/leonsodhi/8eb28e06b2c35c136bf8#file-01papertrail-config

Requirements
------------

OpsWorksの下記の環境下で動作確認済

```
Operating System: Amazon Linux AMI release 2015.03
OpsWorks Layers: Node.js App Server
```

Attributes
----------

<table>
  <tr>
    <th>キー</th>
    <th>型</th>
    <th>説明</th>
    <th>初期値</th>
  </tr>
  <tr>
    <td><tt>["papertrail"]["files"]</tt></td>
    <td>配列</td>
    <td>転送するログファイルのパス</td>
    <td><tt>["/var/log/messages", "/var/log/onecoindog/server.log"]</tt></td>
  </tr>
  <tr>
    <td><tt>["papertrail"]["hostname"]</tt></td>
    <td>文字列</td>
    <td>アプリケーションのサイト名称</td>
    <td><tt>onecoindog</tt></td>
  </tr>
  <tr>
    <td><tt>["papertrail"]["papertrail_host"]</tt></td>
    <td>文字列</td>
    <td>papertrailから指定された転送先のホスト名</td>
    <td><tt>logs.papertrailapp.com</tt></td>
  </tr>
  <tr>
    <td><tt>["papertrail"]["papertrail_port"]</tt></td>
    <td>数値</td>
    <td>papertrailから指定された転送先のポート番号</td>
    <td><tt>1111</tt></td>
  </tr>
</table>

Usage
-----

```
papertrail::default
```

OpsWorksのCustom JSONでは必要に応じて下記のように指定する（StackのSettingsより設定可能）

```json
{
  "papertrail": {
    "files": ["/var/log/messages", "/var/log/onecoindog/server.log"],
    "hostname": "www.onecoindog.com",
    "papertrail_host": "logs.papertrailapp.com",
    "papertrail_port": 1234
  }
}
```
