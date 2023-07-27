class ReviewController < ApplicationController
    $rating_select_options = [1, 2, 3, 4, 5]

    def index
        item_id = params[:id]
        @item = Item.find_by(id: item_id)
        # 商品が存在しない場合は404を返す
        if @item.nil?
            redirect_to('/404.html')
            return
        end
        @reviews = Review.new.select_by_item_id(item_id)
    end

    def new
        item_id = params[:id]
        @item = Item.find_by(id: item_id)
        # 商品が存在しない場合は404を返す
        if @item.nil?
            redirect_to('/404.html')
            return
        end
        @review_form = ReviewForm.new
    end
    
    def create
        # パラメータ受け取り
        review_params = params.require(:review_form).permit(:reviewer_name,
                                                            :review_comment,
                                                            :price_rating,
                                                            :design_rating,
                                                            :quality_rating)
        @review_form = ReviewForm.new(review_params)
        @review_form.review_tag_ids = params[:review_form][:review_tag_ids]
        @review_form.item_id = params[:id]
        # バリデーション
        is_valid = @review_form.valid?
        if is_valid then
            # レビューをDBに保存
            is_success = @review_form.save
            if is_success then
                redirect_to reviews_url,    notice: "レビューが投稿されました"
            else
                redirect_to review_new_url, alert: "エラーが発生したため、レビューの投稿に失敗しました"
            end
        else
            # バリデーションエラーの場合はエラーメッセージを返す
            redirect_to review_new_url, alert: "入力情報が不完全のため、レビューが登録できませんでした", flash: @review_form.get_error_flashes
        end
    end
end
