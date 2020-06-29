class ChangeRecordsLearningpointAndTrainingdateNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :records, :learning_point, false
    change_column_null :records, :training_date, false
  end
end
