class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.string :practice_item
      t.integer :practice_time
      t.references :record, foreign_key: true

      t.timestamps
    end
  end
end
