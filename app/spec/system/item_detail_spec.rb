require 'rails_helper'

RSpec.describe 'ItemDetail', type: :system do
  describe '#index' do
    before do
      # テストデータ投入
      MstMaker.create!([{id: 1,maker_name: 'AAAスポーツ',maker_sentence: 'AAAスポーツのメーカー説明文',},{id: 2,maker_name: 'BBB食品',maker_sentence: 'BBB食品のメーカー説明文',},{id: 3,maker_name: 'CCC電機',maker_sentence: 'CCC電機のメーカー説明文',},{id: 4,maker_name: 'DDD化粧品',maker_sentence: 'DDD化粧品のメーカー説明文',},{id: 5,maker_name: 'EEE縫製',maker_sentence: 'EEE縫製のメーカー説明文',},{id: 6,maker_name: 'FFF商事',maker_sentence: 'FFF商事のメーカー説明文',},])
      MstCategory.create!([{id: 1,category_name: '食品',},{id: 2,category_name: '家電',},{id: 3,category_name: '化粧品',},{id: 4,category_name: '衣類',},{id: 5,category_name: 'スポーツ用品',},])
      MstReviewTag.create!([{id: 1,review_tag_name: 'デザイン',},{id: 2,review_tag_name: '使い心地',},{id: 3,review_tag_name: '成分',},{id: 4,review_tag_name: '価格',},{id: 5,review_tag_name: '説明書',},])
      @item1 = FactoryBot.create(:item1)
      @review1 = FactoryBot.create(:review1, item_id: 1)
      @review2 = FactoryBot.create(:review2, item_id: 1)
      
      visit(item_detail_url(@item1.id))
    end

    describe '商品詳細ページ' do
      it '商品詳細表示画面にアクセスできるか' do
        expect(page.status_code).to eq(200)
      end

      it '商品情報が正しいか' do
        expect(all("h1")[0].text).to eq(@item1.item_name)
        expect(page).to have_content("商品ID: #{@item1.id}")
        expect(page).to have_content("価格: ￥#{@item1.item_price}")
        expect(page).to have_css("img[src*='#{@item1.item_image_path}']")
        expect(page).to have_content("商品説明: #{@item1.item_sentence}")
        expect(page).to have_content("メーカー: #{MstMaker.find(@item1.item_maker_id).maker_name}")
        expect(page).to have_content("メーカー説明: #{MstMaker.find(@item1.item_maker_id).maker_sentence}")
        expect(page).to have_content("カテゴリ: #{MstCategory.find(@item1.item_category_id).category_name}")
        expect(page).to have_content("投稿レビュー数: #{Review.where(item_id: @item1.id).count}")
        expect(page).to have_content("レビュー評価の平均: 3.2 / 5") # テストロジックで間違える恐れがあるのでハードコードする
      end

      it '「レビューを見る」のリンクが存在するか' do
        expect(page).to have_link('レビューを見る', href: "/items/#{@item1.id}/reviews")
      end

      it '同じメーカーの他の商品が存在するか' do
        FactoryBot.create(:item2)
        visit(current_path)
        expect(page.body.scan("メーカー: #{MstMaker.find(@item1.item_maker_id).maker_name}").count).to eq(Item.where(item_maker_id: @item1.item_maker_id).count)
      end
    end
  end
end