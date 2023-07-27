class CreateReviewTags < ActiveRecord::Migration[7.0]
  def change
    create_table :review_tags, id: false do |t|
      t.integer  "review_id",      null: false,  unsigned: true
      t.integer  "review_tag_id",  null: false,  unsigned: true
      t.timestamps
    end
  end
end
