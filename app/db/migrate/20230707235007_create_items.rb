class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string   "item_name",         null: false
      t.integer  "item_price",        null: false
      t.string   "item_image_path",   null: false
      t.text     "item_sentence",     null: false
      t.integer  "item_maker_id",     null: false,  unsigned: true
      t.integer  "item_category_id",  null: false,  unsigned: true
      t.timestamps
    end
  end
end
