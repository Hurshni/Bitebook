class ChangeStartTimeAndEndTimeToTimeInSymptomLogs < ActiveRecord::Migration[7.1]
  def change
    # Changing columns to `time` type
    change_column :symptom_logs, :start_time, :time
    change_column :symptom_logs, :end_time, :time
  end
end
