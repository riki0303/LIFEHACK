## アイテム共有SNS「LIFEHACK」
![946D1CE2-D080-4174-BB01-60110DBC08EC_1_201_a](https://github.com/riki0303/LIFEHACK/assets/121366137/4c75a7b3-a59c-4a33-a3ca-c52bbdc81013)


## URL
https://lifehack-c418ed94be78.herokuapp.com/  
  
ゲストログインにて気軽にサービスを体験する事が出来ます。
  
## 制作した背景
私は日常生活を効率化していく事が好きです。以前同僚とおすすめのガジェットが話題になった際に、気軽に情報を共有できて、後で見てもわかりやすいアプリがあればいいと感じました。ただ情報を見るだけでなく、SNS風にする事でお気に入りのユーザーの使用している最新のアイテムを見る事＋自身も情報を発信できるようにしました。

## ペルソナ
- 性別　男女問わず
- 年齢　２０〜３０代の比較的若年層
- 課題
  - 友人・家族に勧めたい物があるが、情報がまとまっていない為紹介しづらい。
  - 詳しい人が使用している物に興味があるが、大手SNSだと余計な情報も入ってきてしまう。
  
## 用件定義
[要件定義シート_LIFEHACK](https://docs.google.com/spreadsheets/d/1cnBUSZSdrG1cA8rBjxoT0Pq5QipyMIcKsQbRJg7gbB0/edit?pli=1#gid=982722306
)

## デザイン案
[Figma_LIFEHACK](https://www.figma.com/file/JJfOLklpXoTM5jdX8lgCfo/LIFEHACK?type=design&node-id=33%3A394&mode=design&t=jDydBHJBR8P1NPjh-1
)

## 利用方法
| ユーザー管理機能 | 投稿機能 |
| ---- | ---- |
| ![login](https://github.com/riki0303/LIFEHACK/assets/121366137/ba2dca81-c325-401d-9021-8c5e5516a3b1)| ![post-create](https://github.com/riki0303/LIFEHACK/assets/121366137/60cc22cf-d597-4538-8045-a5d5c7c04b48)|
| ユーザーの新規登録、ログイン、ログアウトする事が出来ます。 | 「アイテム」を投稿する事が出来ます。 |

| 一覧表示機能 | 詳細表示機能 |
| ---- | ---- |
| ![post-index+edit](https://github.com/riki0303/LIFEHACK/assets/121366137/510b85a6-bae4-417b-8200-3812e12a4c83)| ![post-show](https://github.com/riki0303/LIFEHACK/assets/121366137/d167e8a2-a86f-4d85-90a8-d012e8354a2a)|
| 投稿された「アイテム」が一覧で表示されます。自分の投稿の編集・削除が可能です。 | 「アイテム」の詳細ページが表示されます。コメントが表示され、コメントする事も可能です。 |

| コメント機能 | プロフィール機能 |
| ---- | ---- |
| ![comment-create](https://github.com/riki0303/LIFEHACK/assets/121366137/8a5e2694-bf8e-4630-8e13-490bfbcb0b17)| ![profile-edit](https://github.com/riki0303/LIFEHACK/assets/121366137/1aa15f82-f01c-42f8-9b78-06f2e8e2b3ef)|
| 投稿にコメントする事が出来ます。 | ユーザー名・自己紹介・アバター画像が設定出来ます。 |

| いいね機能 | いいね一覧機能 |
| ---- | ---- |
| ![like](https://github.com/riki0303/LIFEHACK/assets/121366137/a45cec4f-8fd9-494d-a0e3-2f36fb9bfda2)| ![favorite](https://github.com/riki0303/LIFEHACK/assets/121366137/912e8039-aed4-4154-afbe-f75fe7d94135)|
| ハートをクリックすると、いいねする事が出来ます。 | いいね登録した「アイテム」が一覧で表示されます。 |

| フォロー機能 | タイムライン機能 |
| ---- | ---- |
| ![follow](https://github.com/riki0303/LIFEHACK/assets/121366137/59caf6d5-34d2-4d89-a1eb-2655d1656d4e)| ![timeline](https://github.com/riki0303/LIFEHACK/assets/121366137/f2a1f589-a17e-4f5d-854a-736d12ab3caa)|
| 自分以外のユーザーをフォローする事が出来ます。 | フォロー中ユーザーのアイテムが一覧で表示されます。 |

| 投稿検索 | ユーザー検索 |
| ---- | ---- |
| ![serch](https://github.com/riki0303/LIFEHACK/assets/121366137/88233293-4154-42d5-ba36-320b4b0b9b94)| ![serach-user](https://github.com/riki0303/LIFEHACK/assets/121366137/bea2e282-96cd-4aaa-bb59-bbf9bc4162a9)|

## 使用技術  
### バックエンド
- Ruby 2.7.7
- Rails 6.0.6.1
### フロントエンド
- JavaScript (jQuery)
- CSS (SCSS)
### インフラ
- Heroku
- Amazon S3
## データベース設計
![スクリーンショット 2023-09-26 17 14 40](https://github.com/riki0303/LIFEHACK/assets/121366137/2f8e5cbc-4892-4208-a034-99cb20053479)

## 画面遷移図
<img width="606" alt="スクリーンショット 2023-09-26 17 53 26" src="https://github.com/riki0303/LIFEHACK/assets/121366137/a272245d-7733-44c7-ab89-87852f798d45">

## 学んだ点
### テストコード実装
Rspecでテストコード実装しました。独自の記述方法に慣れるまで時間がかかりました。Qittaでは沼にハマった場面の記事を投稿しています。
https://qiita.com/kokub0303
### N+1問題の解決
開発当初は読み込みにとても時間がかかってしまい原因を模索していた所、N+1問題を知りました。  
コードを書きながら対策していくのがベストですが中々難しい事もあり、'bullet'というN+1を検出してくれるgemを使いながら対応しました。
### Ajaxによる非同期処理
いいね・フォローは非同期で実行出来るように開発しました。  
そもそもの概念や、サーバー側でRails側でAPIを作成しフロント側でJavaScriptをゴリゴリ書いていく必要があった事など新しい学びが多かったです。  
今後はコメントも非同期で実装出来るように改修予定です。

## 今後実装予定の機能
### ベストアイテム機能
これまでに投稿した「アイテム」の中から１つベストアイテムを設定する事で、プロフィールの投稿一覧の先頭の表示させる機能です。投稿が多くてもこれだけは見て欲しいアイテムを設定出来ます。
### ランキング機能
一定期間の間でいいねが多かった「アイテム」を順に表示させる機能です。TOP３までのユーザーにはバッジなど付与する機能もあれば面白そうです。
