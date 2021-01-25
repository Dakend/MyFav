# My Favorite Tube
<img src="https://user-images.githubusercontent.com/49805038/105635702-aecaae80-5ea7-11eb-92b0-8b0907b8b7e4.PNG" width="1000">
「My Favorite Tube」は、YouTube上の"推し動画"をシェアできるWebサービスです。  
推しの動画に対して感想を付け、自分だけのまとめ記事を作成して、投稿できます。

## URL
https://my-favorite-tube.com/

## 制作背景
私の所属しているバンドでMVを作成の話が上がった際、参考にする動画をYouTubeで探しリンク先と感想をLINE上でやりとりをしていました。しかし、動画紹介の数が増えていくと、「誰が」「どの動画を」「どのようにコメントしたか」が分散してしまい非常に見にくく、時間のロスが発生していることが分かりました。
そこで、上記の課題をアプリケーションで解決できないかと考え、本アプリケーションの開発を開始しました。

また、YouTubeの素晴らしい動画をより多くの人に、自分の推しポイントと一緒に、見てもらいたいという思いもありました。
YouTuberにならずとも、気軽に動画をより多くの人に届けることができると考えています。

## 制作ポイント
* YouTube Data API v3を導入して、動画URLから動画タイトル、サムネイル、カテゴリー等を自動取得しています。  
* UI/UXには、こだわり、より直感的に、視覚的に楽しめるような設計にしています。  
  → CSSには、ライブラリを用いず、1から自作しています。  
  → Ajaxによる処理を多く取り入れています。  
  → JSを使わずともCSSで実装できるものについては、なるべくCSSで実装しています。  
  → jqueryは使用せず、JavaScriptで実装しています。
* RSpecによるテスト(ModelSpec・SystemSpec)の約100項目近くをデプロイ時にPASSしています。
* インフラにAWS、開発環境にDocker/docker-compose、GitHubのIssues,PullRequesを用いて、より開発現場を意識して開発を行いました。

## WEBページサンプル

## 環境 / 使用技術
### フロントエンド
* HTML
* CSS / SCSS
* JavaScript / Ajax

### バックエンド
* Ruby 2.6.6
* Ruby on Rails 6.0.3

### テスト
* RSpec

### 開発環境
* MySQL
* Docker / docker-compose

### 本番環境
* Nginx
* Capistrano
* AWS
<br>  VPC / EC2 / RDS / Route53 / ACM / ALB / S3 / CloudWatch

### VSC
* Git / GitHub (pull request, Issues)

### API
* YouTube Data API v3

## 機能一覧
### ユーザー機能
* ユーザー登録・編集 (gem: devise)
* ユーザー詳細表示機能
* ゲストログイン機能
* ログイン・ログアウト機能
* ログイン保持機能
* プロフィール画像の投稿・編集 (ActiveStorage)

### 投稿機能  
* YouTube動画URL貼り付けて、まとめ記事を投稿 (YouTube Data API v3, Ajax / 非同期処理)
* 投稿一覧
* 投稿詳細表示機能
* 投稿削除機能
* 横スクロール機能
* いいね機能（Ajax / 非同期処理）
* ブックマーク機能 (Ajax / 非同期処理）
* コメント機能（Ajax / 非同期処理）
* ハッシュタグ抽出機能
* カテゴリー抽出機能
* ページネーション機能 (Ajax / 非同期処理)
* カテゴリー別一覧表示機能
* ハッシュタグ別一覧表示機能
* YouTube動画をWebページへ埋め込み

### その他
* モデルに対する複数バリデーション(文字数・メールアドレス・パスワードなど)
* Flash機能 (自作)

### 課題
* ユーザーの意見をヒヤリングし、UI/UX改善
* レスポンシブ対応
* CircleCIを用いたCI/CD構築
* ECSによる実行基盤構築
* Vue.jsを用いたSPA化

## AWS構成図
<img src="https://user-images.githubusercontent.com/49805038/105731243-8fe51e80-5f72-11eb-9af5-7fa8a38e1a26.png">

## ER図
<img src="https://user-images.githubusercontent.com/49805038/105636088-d91d6b80-5ea9-11eb-822f-38637cf7fb52.png">
