class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer  "item_id",         null: false,  unsigned: true
      t.string   "reviewer_name",   null: false
      t.text     "review_comment",  null: false
      t.float    "review_rating",   null: false,  unsigned: true,  default: 0
      t.integer  "price_rating",    null: false,  unsigned: true,  default: 0
      t.integer  "design_rating",   null: false,  unsigned: true,  default: 0
      t.integer  "quality_rating",  null: false,  unsigned: true,  default: 0
      t.timestamps
    end
  end
end
