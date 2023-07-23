class ReviewTag < ApplicationRecord
    # review_idに紐づいているタグをタグ名で取得する
    def select_tag_names_by_review_id(review_id)
        tag_names = []
        results = ReviewTag.select('mst_review_tags.review_tag_name AS review_tag_name')
                           .joins('INNER JOIN mst_review_tags ON mst_review_tags.id = review_tags.review_tag_id')
                           .where(review_id: review_id)
        results.each do |result|
            tag_names.push(result.review_tag_name)
        end
        return tag_names
    end
end
