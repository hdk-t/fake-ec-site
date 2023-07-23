# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# mst_makers - メーカーマスタ
MstMaker.create!(
    [
        {
            id: 1,
            maker_name: 'AAAスポーツ',
            maker_sentence: 'AAAスポーツのメーカー説明文',
        },
        {
            id: 2,
            maker_name: 'BBB食品',
            maker_sentence: 'BBB食品のメーカー説明文',
        },
        {
            id: 3,
            maker_name: 'CCC電機',
            maker_sentence: 'CCC電機のメーカー説明文',
        },
        {
            id: 4,
            maker_name: 'DDD化粧品',
            maker_sentence: 'DDD化粧品のメーカー説明文',
        },
        {
            id: 5,
            maker_name: 'EEE縫製',
            maker_sentence: 'EEE縫製のメーカー説明文',
        },
        {
            id: 6,
            maker_name: 'FFF商事',
            maker_sentence: 'FFF商事のメーカー説明文',
        },
    ]
)

# mst_categories - カテゴリマスタ
MstCategory.create!(
    [
        {
            id: 1,
            category_name: '食品',
        },
        {
            id: 2,
            category_name: '家電',
        },
        {
            id: 3,
            category_name: '化粧品',
        },
        {
            id: 4,
            category_name: '衣類',
        },
        {
            id: 5,
            category_name: 'スポーツ用品',
        },
    ]
)

# items - 商品テーブル
Item.create!(
    [
        {
            id: 1,
            item_name: 'カレー',
            item_price: 398,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'カレーの商品説明文',
            item_maker_id: 2,
            item_category_id: 1,
        },
        {
            id: 2,
            item_name: 'ビール',
            item_price: 298,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'ビールの商品説明文',
            item_maker_id: 2,
            item_category_id: 1,
        },
        {
            id: 3,
            item_name: '鯖の缶詰',
            item_price: 298,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: '鯖の缶詰の商品説明文',
            item_maker_id: 2,
            item_category_id: 1,
        },
        {
            id: 4,
            item_name: 'イヤホン',
            item_price: 29800,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'イヤホンの商品説明文',
            item_maker_id: 3,
            item_category_id: 2,
        },
        {
            id: 5,
            item_name: 'ヘッドホン',
            item_price: 49800,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'ヘッドホンの商品説明文',
            item_maker_id: 3,
            item_category_id: 2,
        },
        {
            id: 6,
            item_name: '冷蔵庫',
            item_price: 79800,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: '冷蔵庫の商品説明文',
            item_maker_id: 3,
            item_category_id: 2,
        },
        {
            id: 7,
            item_name: 'ファンデーション',
            item_price: 3980,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'ファンデーションの商品説明文',
            item_maker_id: 4,
            item_category_id: 3,
        },
        {
            id: 8,
            item_name: 'コスメキット',
            item_price: 6980,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'コスメキットの商品説明文',
            item_maker_id: 4,
            item_category_id: 3,
        },
        {
            id: 9,
            item_name: 'リップ',
            item_price: 2980,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'リップの商品説明文',
            item_maker_id: 4,
            item_category_id: 3,
        },
        {
            id: 10,
            item_name: '帽子',
            item_price: 2490,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: '帽子の商品説明文',
            item_maker_id: 5,
            item_category_id: 4,
        },
        {
            id: 11,
            item_name: 'ジャケット',
            item_price: 7490,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'ジャケットの商品説明文',
            item_maker_id: 5,
            item_category_id: 4,
        },
        {
            id: 12,
            item_name: 'ジーンズ',
            item_price: 2490,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'ジーンズの商品説明文',
            item_maker_id: 5,
            item_category_id: 4,
        },
        {
            id: 13,
            item_name: '野球用グローブ',
            item_price: 14980,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: '野球用グローブの商品説明文',
            item_maker_id: 1,
            item_category_id: 5,
        },
        {
            id: 14,
            item_name: 'テニスラケット',
            item_price: 19800,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'テニスラケットの商品説明文',
            item_maker_id: 1,
            item_category_id: 5,
        },
        {
            id: 15,
            item_name: 'ゴルフクラブ',
            item_price: 39800,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'ゴルフクラブの商品説明文',
            item_maker_id: 1,
            item_category_id: 5,
        },
        {
            id: 16,
            item_name: 'お菓子詰め合わせ',
            item_price: 2980,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'お菓子詰め合わせの商品説明文',
            item_maker_id: 6,
            item_category_id: 1,
        },
        {
            id: 17,
            item_name: '洗濯機',
            item_price: 84800,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: '洗濯機の商品説明文',
            item_maker_id: 6,
            item_category_id: 2,
        },
        {
            id: 18,
            item_name: '化粧水',
            item_price: 890,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: '化粧水の商品説明文',
            item_maker_id: 6,
            item_category_id: 3,
        },
        {
            id: 19,
            item_name: 'シャツ',
            item_price: 3500,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: 'シャツの商品説明文',
            item_maker_id: 6,
            item_category_id: 4,
        },
        {
            id: 20,
            item_name: '卓球ラケット',
            item_price: 9800,
            item_image_path: 'item_images/sample_image.png',
            item_sentence: '卓球ラケットの商品説明文',
            item_maker_id: 6,
            item_category_id: 5,
        },
    ]
)

# mst_review_tags - レビュータグマスタ
MstReviewTag.create!(
    [
        {
            id: 1,
            review_tag_name: 'デザイン',
        },
        {
            id: 2,
            review_tag_name: '使い心地',
        },
        {
            id: 3,
            review_tag_name: '成分',
        },
        {
            id: 4,
            review_tag_name: '価格',
        },
        {
            id: 5,
            review_tag_name: '説明書',
        },
    ]
)

# reviews - レビューテーブル
items_count = Item.count
30.times.each do |i|
    price_rating   = rand(1..5)
    design_rating  = rand(1..5)
    quality_rating = rand(1..5)
    review_rating  = ((price_rating.to_i + design_rating.to_i + quality_rating.to_i) / 3.to_f).round(1)
    Review.create(
        {
            item_id:        rand(1..items_count),
            reviewer_name:  "Reviewer#{i}",
            review_comment: "Reviewer#{i}'s Comment",
            review_rating:  review_rating,
            price_rating:   price_rating,
            design_rating:  design_rating,
            quality_rating: quality_rating,
        }
    )
end

# review_tags - レビュータグリレーションテーブル
reviews_count = Review.count
review_tags_count = MstReviewTag.count
reviews_count.times.each do |i|
    review_id = i + 1
    # このレビューに設定するレビュータグの数
    current_review_tags_count = rand(1..review_tags_count)
    # 現在のレビューに設定するレビュータグ
    tmp_current_review_tags = current_review_tags_count.times.map { rand(1..review_tags_count) }
    # 重複削除
    current_review_tags = tmp_current_review_tags.uniq
    current_review_tags.each do |review_tag|
        ReviewTag.create(
            {
                review_id:     review_id,
                review_tag_id: review_tag,
            }
        )
    end
end