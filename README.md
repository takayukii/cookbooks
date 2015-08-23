takayukii's OpsWorks Cookbooks
==============

個人的にOpsWorksで利用するCookbookを集約する。OpsWorksはElastic Beanstalkよりも下記の点で優位性がある。

* Stackに複数のLayerを構築し維持する事ができる
* Layer内のEC2インスタンスの調整（24/7のマニュアルでの伸縮、stopped状態でのインスタンスの保持、Time/Load-based）
* Custom JSONを利用したRecipeの再利用性
* Recipeの各ライフサイクルイベントを通した実行、任意のRecipe実行によるインスタンスのメンテナンス性

OpsWorksでのcookbookの利用
----------

### Layer毎のライフサイクルイベントに設定する

LayerのRecipesからCustom Chef Recipesとして設定する事ができる。その際のCustom JSONはStackに設定する。

__例__

```
{
  "applog": {
    "app_name": "onecoindog"
  },
  "nodeproxy": {
    "http_port": 8080,
    "https_port": 44380,
    "wss_port": 3000
  }
}
```

### コンソールから直接実行する

StackのRun CommandからUpdate Custom Cookbooksの後にExecute Recipeを実行する事でRecipeを単体で実行する事ができる。

```
applog::default
```

ここでもCustom JSONを設定する事ができる。

__例__

```
{
  "applog": {
    "app_name": "onecoindog"
  }
}
```

なお、設定可能なパラメーターは各CookbookのAttributesを参照する事で把握できる。


開発方法
----------

Knife SoloとVagrant(+ sahara plugin)を利用する。なお、本リポジトリはKnife Soloで扱うディレクトリのsite-cookbooks部分のみをリポジトリとして登録している。

* vagrant up
* vagrant sandbox on
* Recipeを作成する
* nodes/hostname.jsonのrunlistを更新する
* knife solo cook hostname
* Recipeの実行が成功したかどうかをvagrant sshして確認する
* vagrant sandbox rollback

__nodesファイルの例__

```
{
  "applogs": {
    "app_name": "hoge"
  },
  "run_list": [
    "recipe[applog, nodeproxy]"
  ],
  "automatic": {
    "ipaddress": "192.168.33.40"
  }
}
```

hostnameは~/.ssh/configにて設定できる

__~/.ssh/configの設定例__

```
Host 192.168.33.40 
  HostName 127.0.0.1
  User vagrant
  Port 2222
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /path/to/vagrant/.vagrant/machines/default/virtualbox/private_key
  IdentitiesOnly yes
  LogLevel FATAL
```

OpsWorks上でのデバッグ方法
----------

調査中
