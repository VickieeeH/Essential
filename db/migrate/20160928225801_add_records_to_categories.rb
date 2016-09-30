class AddRecordsToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :category_id, :integer
  end
end
