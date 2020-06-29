class ChangePracticesPracticeitemAndPracticetimeNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :practices, :practice_item, false
    change_column_null :practices, :practice_time, false
  end
end
