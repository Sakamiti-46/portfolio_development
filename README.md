<img width="２００" alt="TTManager" src="https://user-images.githubusercontent.com/63082672/85826226-22e08f00-b7bf-11ea-8d5d-0e44486a7bbc.png">

# TTManager〜成長を加速せよ〜
卓球選手が、日々の練習内容を記録することで、練習内容の振り返りやメニューの組み立て、課題設定をスムーズに行うことができるWebアプリケーションです。

<img width="400" height="400" alt="スクリーンショット 2020-06-26 15 14 12" src="https://user-images.githubusercontent.com/63082672/85827613-908dba80-b7c1-11ea-8179-f698ac536967.png"><img width="400" height="400" alt="スクリーンショット 2020-06-26 15 25 46" src="https://user-images.githubusercontent.com/63082672/85827545-7522af80-b7c1-11ea-96fa-76338d1b8394.png">

<img width="400" height="400" alt="test" src="https://user-images.githubusercontent.com/63082672/85915879-4d494f80-b886-11ea-8095-d70614c0d699.png"><img width="400" height="400" alt="レポート" src="https://user-images.githubusercontent.com/63082672/85916304-7a97fc80-b88a-11ea-809b-9c37bc8fd975.png">

# URL
https://vast-anchorage-69571.herokuapp.com

# 制作の背景
私は、中学1年生から大学1年生まで7年間卓球を続けておりました。高校時代、私よりも戦績のある強豪校で練習している友人が、練習内容を記録して振り返りと課題設定、練習メニューの組み立てを管理する、手書きの「卓球ノート」に取り組んでいるという話を聞きました。

その取り組みが非常に効果的だと思い、1試合でも多く試合に勝ちたい思いから、早速手書きのノートを買って、それに記録していたのですが、3点問題が発生しました。

①レイアウトの作成や項目の記載に時間がかかる<br>②練習や試合を通じて気づいた点やアドバイスを見返すのに時間がかかる<br>③そのノートを紛失してしまった

以上のことが起こり、私は卓球ノートで、試合に勝つための取り組みから挫折してしまいました。高校を卒業する時も、もし卓球ノートを続けていれば、より効率的で、課題をクリアする質の高い練習と、戦績を残せていたのではないかと思うと、実は後悔しております。

現在は、社会人クラブに入って、週1回程度練習しておりますが、少ない練習時間でも、1試合でも多く試合に勝てるようになりたい！と思い、挫折していた卓球ノートを、Webアプリとして開発すれば、試合に勝てるようになるのではないか？と考え、プログラミング学習の成果物として制作に至りました。

# 機能一覧
- gem deviseを用いたユーザー機能
- gem ransackを用いた検索機能
- gem kaminariを用いたページネーション機能
- chart-js並びに gem cocoonを用いた、データベースに格納された値を円グラフに表示させる機能

# 使用技術
- フロントエンド：JavaScript（ES6）、jQuery3、Bootstrap4、Slim
- バックエンド：Ruby: 2.6.5、 Ruby on Rails: 5.2.4.3
- データベース：PostgreSQL 12.2
- デプロイ： Heroku

# ER図
<img width="400" alt="スクリーンショット 2020-06-26 23 01 05" src="https://user-images.githubusercontent.com/63082672/85915972-10318d00-b887-11ea-843e-bf94f4b313fc.png">

# 工夫した点
- 親レコードに子レコードを３つ関連付けを行い、管理できるようにしたこと
- ActiveRecordを駆使し、メソッドチェーンを用いてデータベースから取得したデータを操作し、正しく表示できたこと
- Ruby on Railsで定義した変数をJavaScriptで使えるようgemを使って実装したこと
- チャートを使って練習時間、項目ごとの割合を可視化する仕組みを入れたこと

# 開発において参考にしたアプリ

https://apps.apple.com/jp/app/%E5%8D%93%E7%90%83%E6%89%8B%E5%B8%B3/id952671702
