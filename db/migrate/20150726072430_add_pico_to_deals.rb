class AddPicoToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :pico, :string
  end
end
