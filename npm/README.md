npm Cookbook
================
1.x系だとnpm install時のエラーが多発するためnpmを2.x系にアップグレードする。

Requirements
------------
OpsWorksの下記の環境下で動作確認済

```
Operating System: Amazon Linux AMI release 2015.03
OpsWorks Layers: Node.js App Server
```

Attributes
----------

なし

Usage
-----

#### npm::update

Notice
-----

OpsWorksの不具合のため現状初回インスタンス起動後の任意の手動デプロイではバージョンがうまく上がらずデプロイに失敗する。そのため常にインスタンス起動でデプロイする必要がある。AWSサポートによると将来的に修正予定（時期未定）。
