wordpress cookbook
==============
WordPressを導入する。

Requirements
------------

下記の環境下で動作確認済

```
$ cat /etc/redhat-release 
CentOS release 6.6 (Final)
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
    <td><tt>["wordpress"][:install_user]</tt></td>
    <td>文字列</td>
    <td>WordPressをインストールするユーザー</td>
    <td><tt>apache</tt></td>
  </tr>
  <tr>
    <td><tt>["wordpress"][:install_path]</tt></td>
    <td>文字列</td>
    <td>WordPressのインストール先のパス</td>
    <td><tt>/var/www/html</tt></td>
  </tr>
  <tr>
    <td><tt>["wordpress"][:dbname]</tt></td>
    <td>文字列</td>
    <td>MySQLのデータベース</td>
    <td><tt>wordpress</tt></td>
  </tr>
  <tr>
    <td><tt>["wordpress"][:dbuser]</tt></td>
    <td>文字列</td>
    <td>MySQLのユーザー名</td>
    <td><tt>wordpress</tt></td>
  </tr>
  <tr>
    <td><tt>["wordpress"][:dbpass]</tt></td>
    <td>文字列</td>
    <td>MySQLのパスワード</td>
    <td><tt>wordpress</tt></td>
  </tr>
  <tr>
    <td><tt>["wordpress"][:dbhost]</tt></td>
    <td>文字列</td>
    <td>MySQLのホスト名</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>["wordpress"][:title]</tt></td>
    <td>文字列</td>
    <td>WordPressのタイトル</td>
    <td><tt>WordPress Test</tt></td>
  </tr>
  <tr>
    <td><tt>["wordpress"][:url]</tt></td>
    <td>文字列</td>
    <td>WordPressのURL</td>
    <td><tt>127.0.0.1</tt></td>
  </tr>
  <tr>
    <td><tt>["wordpress"][:admin_password]</tt></td>
    <td>文字列</td>
    <td>管理者adminのパスワード</td>
    <td><tt>admin</tt></td>
  </tr>
  <tr>
    <td><tt>["wordpress"][:admin_email]</tt></td>
    <td>文字列</td>
    <td>管理者adminのメールアドレス</td>
    <td><tt>admin@example.com</tt></td>
  </tr>
</table>

Usage
-----

#### wordpress::default

```json
{
  "wordpress": {
    "title": "test wordpress",
    "url": "192.168.33.10",
    "admin_password": "admin",
    "admin_email": "admin@example.com"
  }
}
```
