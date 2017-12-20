class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.references :category, foreign_key: true
      t.string :state, limit: 20, null: false, default: 'disabled'

      t.timestamps
    end
  end
end
