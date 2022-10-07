# アプリケーション名
わたしのお気に入り

# アプリケーション概要
ハンドメイドの作品を販売することができる

# URL
https://okiniiri-38385.herokuapp.com/

# テスト用アカウント
・Basic認証パスワード：38385

・Basic認証ID：kobi

・メールアドレス：kkk@yahoo

・パススワード：111kkk

# 利用方法

**商品出品**

* トップページのヘッダーから新規ユーザー登録をする
* 画像、説明文、カテゴリー、金額、発送元地域、発送までの目安、発送方法は必須項目として入力する
* 購入ボタンから購入できる

# アプリケーションを作成した背景
ハンドメイドで物を作るのが好きなので将来的に自分の作品を販売してみたいと思った。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1AkXxRhFXHjQrWW712vLFQrb4BbHHujY8wChh3NNztC8/edit#gid=813409492

# 実装予定の機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/4827a1bba8a8baf75eeb322572972410.png)](https://gyazo.com/4827a1bba8a8baf75eeb322572972410)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/7ddeb7875a6fb67a9f106f76b72c9293.png)](https://gyazo.com/7ddeb7875a6fb67a9f106f76b72c9293)
# 開発環境
フロントエンド：HTML ,CSS ,JavaScript  
バックエンド：Ruby on Rails  
テスト： RSpec  
インフラ：AWS  
エディタ：VScode  
タスク管理：GitHub
# 工夫したポイント
ユーザー視点でわかりやすいと思えるアプリにしたいと思いました。  
具体的には、なるべく画面遷移を少なくしてワンクリックで操作が進む様にしました。  


# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many : items
- has_many : orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    |null: false                     |
| shipping_fee_id   | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| delivery_date_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : order
- belongs_to_active_hash : category
- belongs_to_active_hash : shipping_fee
- belongs_to_active_hash : prefecture
- belongs_to_active_hash : delivery_date

# orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

# Association

- belongs_to : user
- belongs_to : item
- has_one : destination


## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |


### Association

- belongs_to :order
- belongs_to_active_hash : prefecture



### category (active_hash)
- has_many : items

### item_condition (active_hash)
- has_many : items

### shipping_fee (active_hash)
- has_many : items

### prefecture (active_hash)
- has_many : items
- has_many : destinations

### delivery_date (active_hash)
- has_many : items
