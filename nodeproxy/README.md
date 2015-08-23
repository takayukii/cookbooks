nodeproxy Cookbook
==============
SPA+WebSocket通信を行うNode.jsのためのプロキシサーバー。本レシピでは下記のようにnginxを構成し、ELB経由でのHTTPS通信の強制とWebSocketの通信を実現する。このサーバー構成はELBのリスナー設定と密に関わるものであるため合わせて設定する事。なお、SPAを想定しているためJSファイルおよびCSSファイルのgzip圧縮についても設定している。

<table>
  <tr>
    <th>種類</th>
    <th>説明</th>
  </tr>
  <tr>
    <td>HTTP</td>
    <td>HTTPでリクエストを受け付けHTTPSにリダイレクトする</td>
  </tr>
  <tr>
    <td>HTTPS</td>
    <td>Node.jsが起動している80ポートに転送する</td>
  </tr>
  <tr>
    <td>WSS</td>
    <td>WebSocket通信を行う</td>
  </tr>
</table>

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

e.g.
#### nodeproxy::default
<table>
  <tr>
    <th>キー</th>
    <th>型</th>
    <th>説明</th>
    <th>初期値</th>
  </tr>
  <tr>
    <td><tt>['nodeproxy']['http_port']</tt></td>
    <td>数値</td>
    <td>ELBからHTTPで受け付けるポート番号</td>
    <td><tt>8080</tt></td>
  </tr>
  <tr>
    <td><tt>['nodeproxy']['https_port']</tt></td>
    <td>数値</td>
    <td>ELBからHTTPSで受け付けるポート番号</td>
    <td><tt>44380</tt></td>
  </tr>
  <tr>
    <td><tt>['nodeproxy']['wss_port']</tt></td>
    <td>数値</td>
    <td>ELBからSSL/TCPで受け付けるポート番号</td>
    <td><tt>3000</tt></td>
  </tr>
</table>

Usage
-----

#### nodeproxy::default

OpsWorksのCustom JSONでは必要に応じて下記のように指定する（StackのSettingsより設定可能）

```json
{
  "nodeproxy": {
    "http_port": 8080,
    "https_port": 44380,
    "wss_port": 3000
  }
}
```

