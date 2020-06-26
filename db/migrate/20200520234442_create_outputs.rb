class CreateOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :outputs do |t|
      t.text :output_name
      t.references :record, foreign_key: true

      t.timestamps
    end
  end
end
