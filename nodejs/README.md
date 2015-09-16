npm cookbook
================

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
    <td><tt>[:nodejs][:version]</tt></td>
    <td>文字列</td>
    <td>Nodejsバージョン</td>
    <td><tt>10.3.8</tt></td>
  </tr>
</table>

Usage
-----

#### nodejs::change-npm-version

NPMのバージョンを変更する。

```
{
  "nodejs": {
    "npm": {
      "version": "2.1.12"
    }
  }
}
```

#### nodejs::change-nodejs-version

Nodeのバージョンを変更する。

```
{
  "nodejs": {
    "version": "0.12.7"
  }
}
```
