class CreateMstReviewTags < ActiveRecord::Migration[7.0]
  def change
    create_table :mst_review_tags do |t|
      t.string  "review_tag_name",  null: false
      t.timestamps
    end
  end
end
