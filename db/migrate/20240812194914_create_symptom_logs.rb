class CreateSymptomLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :symptom_logs do |t|
      t.date :date
      t.string :symptom
      t.string :severity
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
