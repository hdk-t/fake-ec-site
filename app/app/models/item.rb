class Item < ApplicationRecord
    # 商品を全て取得 パラメータに応じてソートする
    def select_items(sort_option)
        item_base = self.select_base_items
        case sort_option
        when 'rating' then
            return item_base.order(review_rating: :desc)
        when 'review' then
            return item_base.order(review_count: :desc)
        when 'latest' then
            return item_base.order(created_at: :desc)
        else
            return item_base.order(review_count: :desc)
        end
    end

    # item_idから商品情報を取得
    def select_by_id(item_id)
        item_base = self.select_base_items
        return item_base.find_by(id: item_id)
    end

    # 同じメーカーのIDを取得
    def select_by_maker_exclude_item_id(item_maker_id, item_id)
        item_base = self.select_base_items
        return item_base.where(item_maker_id: item_maker_id)
                        .where.not(id: item_id)
                        .order(review_count: :desc)
    end

    private
    
    # 商品情報のベースを取得
    def select_base_items
        return Item.select('
            items.id AS item_id, 
            items.item_name AS item_name, 
            items.item_price AS item_price, 
            items.item_image_path AS item_image_path, 
            items.item_sentence AS item_sentence, 
            items.item_maker_id AS item_maker_id, 
            mst_makers.maker_name AS maker_name, 
            mst_makers.maker_sentence AS maker_sentence, 
            mst_categories.category_name AS category_name, 
            COUNT(reviews.id) AS review_count, 
            if(COUNT(reviews.id) > 0,
                ROUND(AVG(reviews.review_rating), 1),
                0.0
            ) AS review_rating,
            items.created_at AS created_at
        ')
        .joins('INNER JOIN mst_makers ON mst_makers.id = items.item_maker_id')
        .joins('INNER JOIN mst_categories ON mst_categories.id = items.item_category_id')
        .joins('LEFT OUTER JOIN reviews ON reviews.item_id = items.id')
        .group('items.id')
    end
end
