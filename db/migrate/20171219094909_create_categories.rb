class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :state, null: false, default: 'disabled'
      t.references :vertical, index: true, foreign_key: true

      t.timestamps
    end
  end
end
