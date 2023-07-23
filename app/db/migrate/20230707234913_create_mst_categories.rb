class CreateMstCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :mst_categories do |t|
      t.string  "category_name",  null: false
      t.timestamps
    end
  end
end
