class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|

      t.string :tittle, null: false, default: ""
      t.time :start_time
      t.time :end_time

      t.references :catering_company

      t.timestamps null: false
    end
  end
end
