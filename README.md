# fake-ec-site
架空のECサイト

# 機能
## 商品一覧画面
- 商品一覧表示機能
- 評価の高い順に並び替え機能
- レビューの多い順に並び替え機能
- 商品の新しい順に並び替え機能

## 商品詳細画面
- 商品情報詳細表示機能
- 同メーカー商品表示機能

## レビュー一覧画面
- レビュー一覧表示機能

## レビュー投稿画面
- レビュー投稿機能

# 開発環境構築
## コンテナを立ち上げる
    docker-compose up -d

## データベースを作成
    docker exec -it fake_ec_site_app rails db:create
    docker exec -it fake_ec_site_app rails db:migrate

## 開発用の初期データを投入
    docker exec -it fake_ec_site_app rails db:seed

# テスト実行手順
## DBの中身を全て削除
    docker exec -it fake_ec_site_app rails db:migrate:reset

## 環境をtestに切り替える
    docker exec -it fake_ec_site_app rails db:environment:set RAILS_ENV=test

## RSpecを実行
    docker exec -it fake_ec_site_app rspec
