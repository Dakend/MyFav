# My Favorite Tube
<img src="https://user-images.githubusercontent.com/49805038/105635702-aecaae80-5ea7-11eb-92b0-8b0907b8b7e4.PNG" width="1000">
「My Favorite Tube」は、YouTube上の"推し動画"をシェアできるWebサービスです。  
お気に入りの動画に対して感想を付け、自分だけのまとめ記事を投稿できます。

## URL
https://my-favorite-tube.com/

## 制作背景
私の所属しているバンドでMV作成の話が出た際、参考にするYouTube動画のリンクと注目ポイントをLINE上で流す方式を取っていました。  
しかし、動画の紹介数が増えていくと、「誰が」「どの動画を」「どのようにコメントしたのか」が分散してしまい、非常に見にくく、時間のロスが発生していることが分かりました。  
そこで、上記の課題をアプリケーションで解決できないかと考え、本アプリケーションの開発を開始しました。

加えて、YouTubeの素晴らしい動画をより多くの人に、自分の推しポイントと共に見てもらい、広めてほしいという思いもありました。  
本サービスを使えば、YouTuberにならずとも、気軽に動画をより多くの人に届けることができると考えています。

## 制作ポイント
* YouTube Data API v3を導入して、動画URLから動画タイトル、サムネイル、カテゴリー等を自動取得しています。  
* UI/UXにこだわり、より直感的に視覚的に楽しめるような設計にしています。  
  → CSSは、ライブラリを用いず、1から自作しています。  
  → Ajaxによる処理を多く取り入れ、早いレスポンスを実現しています。  
  → JSを使わずともCSSで実装できるものについては、処理速度の観点からCSSで実装しています。  
* RSpecによるテスト(ModelSpec・SystemSpec)を約100項目実装し、デプロイ時にPASSしています。  
* インフラにAWS、開発環境にDocker/docker-compose、Version管理にGitHubのIssues/PullRequestを用いて、現場を意識した開発を行いました。

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
* ユーザー詳細表示
* ゲストログイン
* ログイン・ログアウト
* ログイン保持
* プロフィール画像の投稿・編集 (ActiveStorage)

### 投稿機能  
* YouTube動画のURLを貼り付けて、まとめ記事を投稿 (YouTube Data API v3, Ajax)
* 投稿一覧
* 投稿詳細表示
* 投稿削除
* 横スクロール
* ハッシュタグ
* いいね (Ajax）
* ブックマーク (Ajax）
* コメント (Ajax）
* ページネーション (Ajax）
* カテゴリー別一覧表示
* ハッシュタグ別一覧表示
* カテゴリー自動抽出

### その他
* モデルに対するバリデーション(文字数・メールアドレス・パスワードなど)
* Flash機能 (自作)

### 課題
* ユーザーの意見をヒヤリングし、UI/UX改善
* レスポンシブ対応
* CircleCIを用いたCI構築
* ECSによる実行基盤構築

## AWS構成図
<img src="https://user-images.githubusercontent.com/49805038/105731243-8fe51e80-5f72-11eb-9af5-7fa8a38e1a26.png">

## ER図
<img src="https://user-images.githubusercontent.com/49805038/105636088-d91d6b80-5ea9-11eb-822f-38637cf7fb52.png">
