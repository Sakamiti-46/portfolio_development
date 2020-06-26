class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :user_id
      t.text :learining_point
      t.date :training_date

      t.timestamps
    end
  end
end