class AddPicoToCateringCompany < ActiveRecord::Migration
  def change
    add_column :catering_companies, :pico, :string
  end
end
