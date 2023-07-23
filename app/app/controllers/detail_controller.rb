class DetailController < ApplicationController
    def index
        item_id = params[:id]
        item = Item.new
        # 現在のitemidの商品情報を取得
        @item_detail = item.select_by_id(item_id)
        # 商品が存在しない場合は404を返す
        if @item_detail.nil?
            redirect_to('/404.html')
            return
        end
        # 現在のitemidを除いた同じメーカーの他の商品を取得
        @same_maker_items = item.select_by_maker_exclude_item_id(@item_detail.item_maker_id, item_id)
    end
end
