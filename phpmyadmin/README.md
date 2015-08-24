phpmyadmin cookbook
==============
phpMyAdminを導入する。

Requirements
------------

OpsWorksの下記の環境下で動作確認済

```
Operating System: Amazon Linux AMI release 2015.03
OpsWorks Layers: Node.js App Server
```

Attributes
----------

Attributesでは構成するサーバーのポート番号を指定できる。

<table>
  <tr>
    <th>キー</th>
    <th>型</th>
    <th>説明</th>
    <th>初期値</th>
  </tr>
  <tr>
    <td><tt>["phpmyadmin"]["db_hostname"]</tt></td>
    <td>文字列</td>
    <td>MySQLのホスト名</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
</table>

Usage
-----

#### phpmyadmin::nginx

OpsWorksのCustom JSONでは必要に応じて下記のように指定する（StackのSettingsより設定可能）

```json
{
  "phpmyadmin": {
    "db_hostname": "url.to.rds.com"
  }
}
```

注）phpMyAdminはパスがそのままだと攻撃されやすいため避ける事。
