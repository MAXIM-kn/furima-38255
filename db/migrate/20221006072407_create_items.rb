class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name, null: false
      t.text       :description, null: false
      t.integer    :condition_id, null: false
      t.integer    :shippong_cost_id, null: false
      t.integer    :shippong_area_id, null: false
      t.integer    :shippong_days_id, null: false
      t.integer    :price, null: false
      t.integer    :category_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
