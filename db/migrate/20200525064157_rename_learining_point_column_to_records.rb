class RenameLeariningPointColumnToRecords < ActiveRecord::Migration[5.2]
  def change
    rename_column :records, :learining_point, :learning_point
  end
end
