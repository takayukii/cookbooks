lamp cookbook
==============
LAMP環境を導入する。

Requirements
------------

下記の環境下で動作確認済

```
$ cat /etc/redhat-release 
CentOS release 6.6 (Final)
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
    <td><tt>["lamp"]["mysql"]["user"]</tt></td>
    <td>文字列</td>
    <td>MySQLのユーザー名</td>
    <td><tt>testuser</tt></td>
  </tr>
  <tr>
    <td><tt>["lamp"]["mysql"]["password"]</tt></td>
    <td>文字列</td>
    <td>MySQLのパスワード</td>
    <td><tt>password</tt></td>
  </tr>
  <tr>
    <td><tt>["lamp"]["mysql"]["database"]</tt></td>
    <td>文字列</td>
    <td>MySQLのデータベース</td>
    <td><tt>testdb</tt></td>
  </tr>
</table>

Usage
-----

#### lamp::default

```json
{
  "lamp": {
    "mysql": {
      "user": "xxxx",
      "password": "xxxx",
      "database": "xxxx"
    }
  }
}
```
