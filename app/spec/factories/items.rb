FactoryBot.define do
  factory :item1, class: 'Item' do
    id               { 1 }
    item_name        { 'item1' }
    item_price       { 100 }
    item_image_path  { 'item_images/sample_image.png' }
    item_sentence    { 'item1の商品説明文' }
    item_maker_id    { 1 }
    item_category_id { 1 }
    created_at       { '2023-07-19 18:00:00' }
  end
  factory :item2, class: 'Item' do
    id               { 2 }
    item_name        { 'item2' }
    item_price       { 100 }
    item_image_path  { 'item_images/sample_image.png' }
    item_sentence    { 'item2の商品説明文' }
    item_maker_id    { 1 }
    item_category_id { 2 }
    created_at       { '2023-07-19 12:00:00' }
  end
  factory :item3, class: 'Item' do
    id               { 3 }
    item_name        { 'item3' }
    item_price       { 100 }
    item_image_path  { 'item_images/sample_image.png' }
    item_sentence    { 'item3の商品説明文' }
    item_maker_id    { 3 }
    item_category_id { 3 }
    created_at       { '2023-07-19 06:00:00' }
  end
end
