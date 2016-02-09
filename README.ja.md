## これは何？

SlackのアーカイブファイルがJSONで出力されるので、そのJSONをCSVに変換するツールです

## 使い方

### 前提となるアーカイブ
Slackのアーカイブは以下の様なディレクトリ構成です。

```
├── channels.json
├── general
│   ├── 2015-05-22.json
│   ├── 2016-01-04.json
│   └── 2016-02-02.json
├── integration_logs.json
├── random
│   ├── 2015-05-22.json
│   ├── 2015-10-22.json
│   └── 2016-02-02.json
├── test
│   └── 2015-08-19.json
└── users.json
```

### ユーザー一覧
```
ruby csvuser.rb users.json
```
ユーザIDとユーザ名がタブ区切りで出力されます。Macの場合はpbcopyなどにリダイレクトすると、クリップボードに入るので、エクセルやGoogleSpreaSheetに貼り付けてください

例）
```
ruby csvuser.rb users.json | pbcopy
```

### メッセージ一覧
第一引数にチャンネルのディレクトリを指定します。ディレクトリの中のjsonをパースして、CSVに変換します。
ユーザ,テキスト,日付 の３カラムのみ抽出しています。
```
ruby csvmessages.rb general 
```
