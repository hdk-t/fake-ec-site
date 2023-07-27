require 'rails_helper'

RSpec.describe 'Review', type: :system do
  describe '#index' do
    before do
      # テストデータ投入
      MstMaker.create!([{id: 1,maker_name: 'AAAスポーツ',maker_sentence: 'AAAスポーツのメーカー説明文',},{id: 2,maker_name: 'BBB食品',maker_sentence: 'BBB食品のメーカー説明文',},{id: 3,maker_name: 'CCC電機',maker_sentence: 'CCC電機のメーカー説明文',},{id: 4,maker_name: 'DDD化粧品',maker_sentence: 'DDD化粧品のメーカー説明文',},{id: 5,maker_name: 'EEE縫製',maker_sentence: 'EEE縫製のメーカー説明文',},{id: 6,maker_name: 'FFF商事',maker_sentence: 'FFF商事のメーカー説明文',},])
      MstCategory.create!([{id: 1,category_name: '食品',},{id: 2,category_name: '家電',},{id: 3,category_name: '化粧品',},{id: 4,category_name: '衣類',},{id: 5,category_name: 'スポーツ用品',},])
      MstReviewTag.create!([{id: 1,review_tag_name: 'デザイン',},{id: 2,review_tag_name: '使い心地',},{id: 3,review_tag_name: '成分',},{id: 4,review_tag_name: '価格',},{id: 5,review_tag_name: '説明書',},])
      @item2 = FactoryBot.create(:item2)
      @review1 = FactoryBot.create(:review1)
      @review2 = FactoryBot.create(:review2, item_id: 2)
      ReviewTag.create!([{ review_id: 1, review_tag_id: 1},{ review_id: 1, review_tag_id: 2 },{ review_id:2, review_tag_id: 3 }])

      visit(reviews_url(id: @item2.id))
    end

    describe 'レビュー一覧' do
      it 'レビュー一覧表示画面にアクセスできるか' do
        expect(page.status_code).to eq(200)
      end

      it '全てのレビューが表示されているか' do
        expect(all("h5")[0].text).to eq("#{@review1.reviewer_name} さんのレビュー")
        expect(all("h5")[1].text).to eq("#{@review2.reviewer_name} さんのレビュー")
      end

      it 'レビューが正しく表示されているか' do
        expect(page).to have_content("#{@review1.reviewer_name} さんのレビュー")
        expect(page).to have_content("コメントタグ: #デザイン #使い心地") # テストロジックで間違える恐れがあるのでハードコードする
        expect(page).to have_content("コメント: #{@review1.review_comment}")
        expect(page).to have_content("総合評価: #{@review1.review_rating} / 5")
        expect(page).to have_content("価格評価: #{@review1.price_rating} / 5")
        expect(page).to have_content("デザイン評価: #{@review1.design_rating} / 5")
        expect(page).to have_content("品質評価: #{@review1.quality_rating} / 5")
      end

      it '「{商品名}のレビューを投稿する」のリンクが存在するか' do
        expect(page).to have_link("#{@item2.item_name}のレビューを投稿する", href: "/items/#{@item2.id}/reviews/new")
      end
    end
  end

  describe '#new' do
    before do
      # テストデータ投入
      MstMaker.create!([{id: 1,maker_name: 'AAAスポーツ',maker_sentence: 'AAAスポーツのメーカー説明文',},{id: 2,maker_name: 'BBB食品',maker_sentence: 'BBB食品のメーカー説明文',},{id: 3,maker_name: 'CCC電機',maker_sentence: 'CCC電機のメーカー説明文',},{id: 4,maker_name: 'DDD化粧品',maker_sentence: 'DDD化粧品のメーカー説明文',},{id: 5,maker_name: 'EEE縫製',maker_sentence: 'EEE縫製のメーカー説明文',},{id: 6,maker_name: 'FFF商事',maker_sentence: 'FFF商事のメーカー説明文',},])
      MstCategory.create!([{id: 1,category_name: '食品',},{id: 2,category_name: '家電',},{id: 3,category_name: '化粧品',},{id: 4,category_name: '衣類',},{id: 5,category_name: 'スポーツ用品',},])
      MstReviewTag.create!([{id: 1,review_tag_name: 'デザイン',},{id: 2,review_tag_name: '使い心地',},{id: 3,review_tag_name: '成分',},{id: 4,review_tag_name: '価格',},{id: 5,review_tag_name: '説明書',},])
      @item2 = FactoryBot.create(:item2)
      
      visit(review_new_url(id: @item2.id))
    end

    describe 'レビュー投稿' do
      it 'レビュー一覧表示画面にアクセスできるか' do
        expect(page.status_code).to eq(200)
      end

      it 'レビューが正しく投稿できるか' do
        # レビュー投稿
        fill_in('お名前', with: 'お名前_テスト')
        check('review_form_review_tag_ids_1') # デザイン
        check('review_form_review_tag_ids_2') # 使い心地
        fill_in('コメント', with: 'コメント_テスト')
        select('2', from: 'review_form_price_rating')
        select('3', from: 'review_form_design_rating')
        select('5', from: 'review_form_quality_rating')
        click_button('レビューを投稿')

        # データ確認
        expect(page.status_code).to eq(200)
        expect(page).to have_content("お名前_テスト さんのレビュー")
        expect(page).to have_content("コメントタグ: #デザイン #使い心地")
        expect(page).to have_content("コメント: コメント_テスト")
        expect(page).to have_content("総合評価: 3.3 / 5")
        expect(page).to have_content("価格評価: 2 / 5")
        expect(page).to have_content("デザイン評価: 3 / 5")
        expect(page).to have_content("品質評価: 5 / 5")
      end

      it 'データが正しくない場合はバリデーションエラーになるか' do
        # レビュー投稿
        fill_in('お名前', with: 'お名前_テスト')
        check('review_form_review_tag_ids_1') # デザイン
        check('review_form_review_tag_ids_2') # 使い心地
        fill_in('コメント', with: 'コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_テスト_401コメント_')
        select('2', from: 'review_form_price_rating')
        select('3', from: 'review_form_design_rating')
        select('5', from: 'review_form_quality_rating')
        click_button('レビューを投稿')

        # エラーメッセージが表示されているか
        expect(page).to have_content('入力情報が不完全のため、レビューが登録できませんでした')
      end
    end
  end
end