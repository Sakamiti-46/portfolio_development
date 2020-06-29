class ChangeOutputsOutputnameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :outputs, :output_name, false
  end
end