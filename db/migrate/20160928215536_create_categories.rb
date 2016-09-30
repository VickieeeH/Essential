class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.text :title
      t.text :description
      t.timestamps
    end
  end
end
