class Review < ApplicationRecord
    attr_accessor :tag_names
    @tag_names = []

    # item_idからレビュー情報を取得
    def select_by_item_id(item_id)
        review_tag = ReviewTag.new()
        result_reviews = []
        reviews = Review.where(item_id: item_id)
        reviews.each do |review|
            # レビュータグを取得
            review.tag_names = review_tag.select_tag_names_by_review_id(review.id)
            result_reviews.push(review)
        end
        return result_reviews
    end
end
