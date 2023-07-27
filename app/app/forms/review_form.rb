class ReviewForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attr_accessor :item_id,
                  :reviewer_name,
                  :review_tag_ids,
                  :review_comment,
                  :price_rating,
                  :design_rating, 
                  :quality_rating

    validates :reviewer_name,  presence: true, length: { minimum: 1, maximum: 20 }
    validates :review_comment, presence: true, length: { minimum: 1, maximum: 400 }
    validates :price_rating,   allow_blank: false, numericality: {only_integer: true, in: 1..5}
    validates :design_rating,  allow_blank: false, numericality: {only_integer: true, in: 1..5}
    validates :quality_rating, allow_blank: false, numericality: {only_integer: true, in: 1..5}
    validate  :validate_review_tag_ids

    # review_tag_idsのカスタムバリデーション
    def validate_review_tag_ids
        # タグが１つも選択されていない
        if @review_tag_ids.nil?
            self.errors.add(:review_tag_ids, 'は1つ以上選択してください')
            return
        end

        # 重複していないか(普通に使用していればここは通らない)
        if (@review_tag_ids.length - @review_tag_ids.uniq.length) > 0
            self.errors.add(:review_tag_ids, ': 不正な操作です')
            return
        end

        # マスタに存在しているか(普通に使用していればここは通らない)
        param_count = @review_tag_ids.length
        mst_count = MstReviewTag.where(id: @review_tag_ids).count
        if param_count != mst_count
            self.errors.add(:review_tag_ids, ': 不正な操作です')
            return
        end
    end

    # レビュー情報をDBに保存
    def save
        begin
            ActiveRecord::Base.transaction do
                review_rating = ((@price_rating.to_i + @design_rating.to_i + @quality_rating.to_i) / 3.to_f).round(1)
                review = Review.create(
                    {
                        item_id:        @item_id,
                        reviewer_name:  @reviewer_name,
                        review_comment: @review_comment,
                        review_rating:  review_rating,
                        price_rating:   @price_rating,
                        design_rating:  @design_rating,
                        quality_rating: @quality_rating,
                    }
                )
                @review_tag_ids.each do |review_tag_id|
                    ReviewTag.create(
                        {
                            review_id:     review.id,
                            review_tag_id: review_tag_id,
                        }
                    )
                end
            end
            return true
        rescue => e
            Rails.logger.error(e)
            return false
        end
    end

    # バリデーションエラー時のflashを返す
    def get_error_flashes
        return {
            error_message_reviewer_name:  self.errors.full_messages_for(:reviewer_name),
            error_message_review_tag_ids: self.errors.full_messages_for(:review_tag_ids),
            error_message_review_comment: self.errors.full_messages_for(:review_comment),
            error_message_price_rating:   self.errors.full_messages_for(:price_rating),
            error_message_design_rating:  self.errors.full_messages_for(:design_rating),
            error_message_quality_rating: self.errors.full_messages_for(:quality_rating),
            old_reviewer_name:  @reviewer_name.slice(0..99),   # 制限しないとActionDispatch::Cookies::CookieOverflowエラーが発生する
            old_review_tag_ids: @review_tag_ids,
            old_review_comment: @review_comment.slice(0..999), # 制限しないとActionDispatch::Cookies::CookieOverflowエラーが発生する
            old_price_rating:   @price_rating,
            old_design_rating:  @design_rating,
            old_quality_rating: @quality_rating,
        }
    end
end