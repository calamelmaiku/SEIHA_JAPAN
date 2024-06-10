# アプリケーション名
セイハ！

# アプリケーション概要
訪れた場所記録し、それがステータスとなり達成感が得られるWEBアプリ

# URL
https://seiha-japan.onrender.com

# テスト用アカウント
* Basic認証パスワード：1818
* Basic認証ID：seiha
* メールアドレス：seiha@seiha.com
* パスワード：seiha1818

# 利用方法
1.トップページ(一覧ページ)ヘッダーから新規登録を行います。  
2.任意のグループ名からグループ詳細ページに遷移し、さらに任意のスポット名からのスポット詳細ページに遷移します。  
3.スポット詳細ページからイッタボタンを押し、イッタ登録をします。  
4.トップページでグループごとのイッタ達成率が視覚的にわかります。100%になると表記が変わります。  

# アプリケーションを作成した背景
旅行に達成感を与えたかったからです。旅行をする際に、訪れた場所をグループごとに管理するためのツールが不足していると感じました。また、旅行前にどのようなグループが存在するのかを把握することが難しく、インターネット上の情報も散在しているため、簡潔に把握できる手段が少ないと感じました。
これらの課題を解決するために、訪れた場所をシンプルかつ美しくまとめ、各グループごとの達成率を一目で確認できるサービスを提供することにしました。ユーザーが訪れた場所を記録し、グループごとの達成度を視覚的に追跡することで、旅行の楽しみと達成感をさらに高めることを目的としています。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/a9f5201b05fe1c6063a3bc2b82c7e8eb.png)](https://gyazo.com/a9f5201b05fe1c6063a3bc2b82c7e8eb)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/a1456966e4cd0576acd008e00d66ea92.png)](https://gyazo.com/a1456966e4cd0576acd008e00d66ea92)

## 使用技術
- **Ruby on Rails**: バックエンドフレームワークとして使用
- **Google Maps API**: 地図表示と位置情報管理のために使用
- **RSpec**: テストフレームワーク
- **FactoryBot**: テストデータの生成
- **Render**: デプロイプラットフォーム
- **HTML/CSS**: フロントエンドのマークアップとスタイル

# ローカルでの動作方法
## インストール方法
1. リポジトリをクローン
   ```sh
    git clone https://github.com/caramelmaiku/SEIHA_JAPAN.git
2. 必要な依存関係をインストール
   ```sh
    bundle install
3. データベースをセットアップ
   ```sh
    rails db:create   
    rails db:migrate
4. サーバーを起動
   ```sh
    rails s
## 使用方法
1. ブラウザで `http://localhost:3000` にアクセスします。
2. グループ詳細ページでスポットを確認します。
3. スポット詳細ページでイッタ登録やコレカラ登録を行います。

# 工夫したポイント
### 1. シンプルで使いやすいインターフェース
シンプルで一貫性のあるデザインを心がけました。
### 2. Googleマップ・達成率の表示
Google Maps APIを用いた地図表示は、場所を一目で確認できるように工夫しています。達成率が一目でわかるよう円グラフも作成しました。
### 3. 管理者によるデータベースの管理
管理者側だけがグループをセットできる仕組みは、グループの価値を下げず、達成感を維持できます。


# 今後実装したい機能
* ユーザー同士で達成率を公開できる機能
* いつ行ったのか一覧でわかる機能
* 2回目以降のイッタ情報も登録できる機能