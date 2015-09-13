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

#### nodejs::upgrade-npm

1.x系だとnpm install時のエラーが多発するためnpmを2.x系にアップグレードする。

なお、OpsWorksの不具合のため現状初回インスタンス起動後の任意の手動デプロイではバージョンがうまく上がらずデプロイに失敗する。そのため常にインスタンス起動でデプロイする必要がある。AWSサポートによると将来的に修正予定との事（時期未定）。

#### nodejs::change-nodejs-version

Nodeのバージョンを変更する。

```
{
  "nodejs": {
    "version": "0.12.7"
  }
}
```
