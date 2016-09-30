class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :title
      t.string :content
      t.string :string
      t.string :status
      t.string :frequency
      t.date :due_date
      t.integer :status
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
