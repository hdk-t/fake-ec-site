class CreateMstMakers < ActiveRecord::Migration[7.0]
  def change
    create_table :mst_makers do |t|
      t.string  "maker_name",      null: false
      t.text    "maker_sentence",  null: false
      t.timestamps
    end
  end
end
