class CreateInavailabilities < ActiveRecord::Migration
  def change
    create_table :inavailabilities do |t|

      t.references :time_slot
      t.references :catering_company
      t.date :date

      t.timestamps null: false
    end
  end
end
