class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :uid
      t.string :number
      t.integer :source_language_id
      t.integer :target_language_id
      t.text :source_text
      t.text :target_text
      t.text :comments
      t.string :state
    end
  end
end
