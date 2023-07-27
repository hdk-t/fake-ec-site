require 'rails_helper'

RSpec.describe 'ItemList', type: :system do
  describe '#index' do
    before do
      # テストデータ投入
      MstMaker.create!([{id: 1,maker_name: 'AAAスポーツ',maker_sentence: 'AAAスポーツのメーカー説明文',},{id: 2,maker_name: 'BBB食品',maker_sentence: 'BBB食品のメーカー説明文',},{id: 3,maker_name: 'CCC電機',maker_sentence: 'CCC電機のメーカー説明文',},{id: 4,maker_name: 'DDD化粧品',maker_sentence: 'DDD化粧品のメーカー説明文',},{id: 5,maker_name: 'EEE縫製',maker_sentence: 'EEE縫製のメーカー説明文',},{id: 6,maker_name: 'FFF商事',maker_sentence: 'FFF商事のメーカー説明文',},])
      MstCategory.create!([{id: 1,category_name: '食品',},{id: 2,category_name: '家電',},{id: 3,category_name: '化粧品',},{id: 4,category_name: '衣類',},{id: 5,category_name: 'スポーツ用品',},])
      MstReviewTag.create!([{id: 1,review_tag_name: 'デザイン',},{id: 2,review_tag_name: '使い心地',},{id: 3,review_tag_name: '成分',},{id: 4,review_tag_name: '価格',},{id: 5,review_tag_name: '説明書',},])
      @item1 = FactoryBot.create(:item1)
      @item2 = FactoryBot.create(:item2)
      @item3 = FactoryBot.create(:item3)
      @review1 = FactoryBot.create(:review1)
      @review2 = FactoryBot.create(:review2)
      @review3 = FactoryBot.create(:review3)
      
      visit(item_list_url)
    end
    
    describe '商品一覧' do
      it '商品一覧表示画面にアクセスできるか' do
        expect(page.status_code).to eq(200)
      end

      it '商品情報が正しく表示されているか' do
        #一度全部削除
        Item.destroy_all

        @item1 = FactoryBot.create(:item1)
        visit(current_path)
        expect(all("h5")[0].text).to eq(@item1.item_name)
        expect(page).to have_content("商品ID: #{@item1.id}")
        expect(page).to have_content("商品説明: #{@item1.item_sentence}")
        expect(page).to have_content("メーカー: #{MstMaker.find(@item1.item_maker_id).maker_name}")
        expect(page).to have_content("投稿レビュー数: #{Review.where(item_id: @item1.id).count}") 
        expect(page).to have_content("レビュー評価の平均: 0.0 / 5") # テストロジックで間違える可能性があるのでハードコードする
        Item.destroy(@item1.id)

        @item2 = FactoryBot.create(:item2)
        visit(current_path)
        expect(all("h5")[0].text).to eq(@item2.item_name)
        expect(page).to have_content("商品ID: #{@item2.id}")
        expect(page).to have_content("商品説明: #{@item2.item_sentence}")
        expect(page).to have_content("メーカー: #{MstMaker.find(@item2.item_maker_id).maker_name}")
        expect(page).to have_content("投稿レビュー数: #{Review.where(item_id: @item2.id).count}") 
        expect(page).to have_content("レビュー評価の平均: 4.7 / 5") # テストロジックで間違える恐れがあるのでハードコードする
        Item.destroy(@item2.id)

        @item3 = FactoryBot.create(:item3)
        visit(current_path)
        expect(all("h5")[0].text).to eq(@item3.item_name)
        expect(page).to have_content("商品ID: #{@item3.id}")
        expect(page).to have_content("商品説明: #{@item3.item_sentence}")
        expect(page).to have_content("メーカー: #{MstMaker.find(@item3.item_maker_id).maker_name}")
        expect(page).to have_content("投稿レビュー数: #{Review.where(item_id: @item3.id).count}") 
        expect(page).to have_content("レビュー評価の平均: 2.0 / 5") # テストロジックで間違える恐れがあるのでハードコードする
      end

      it 'デフォルトでレビューの多い順に表示されているか' do
        expect(page.body.index(@item3.item_name)).to be < page.body.index(@item2.item_name)
        expect(page.body.index(@item2.item_name)).to be < page.body.index(@item1.item_name)
      end
      
      it '「評価の高い順に並び替え」のリンクが存在するか' do
        expect(page).to have_link('評価の高い順に並び替え', href: '/?sort=rating')
      end

      it '「評価の高い順に並び替え」を押した時評価の高い順にソートされるか' do
        click_on('評価の高い順に並び替え')
        expect(page.body.index(@item2.item_name)).to be < page.body.index(@item3.item_name)
        expect(page.body.index(@item3.item_name)).to be < page.body.index(@item1.item_name)
      end

      it '「レビューの多い順に並び替え」のリンクが存在するか' do
        expect(page).to have_link('レビューの多い順に並び替え', href: '/?sort=review')
      end

      it '「レビューの多い順に並び替え」を押した時レビューの多い順にソートされるか' do
        click_on('レビューの多い順に並び替え')
        expect(page.body.index(@item3.item_name)).to be < page.body.index(@item2.item_name)
        expect(page.body.index(@item2.item_name)).to be < page.body.index(@item1.item_name)
      end

      it '「商品の新しい順に並び替え」のリンクが存在するか' do
        expect(page).to have_link('商品の新しい順に並び替え', href: '/?sort=latest')
      end

      it '「商品の新しい順に並び替え」を押した時商品の新しい順にソートされるか' do
        click_on('商品の新しい順に並び替え')
        expect(page.body.index(@item1.item_name)).to be < page.body.index(@item2.item_name)
        expect(page.body.index(@item2.item_name)).to be < page.body.index(@item3.item_name)
      end
    end
  end
end