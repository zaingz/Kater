class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, default: ""
    add_column :users, :last_name, :string,   default: ""
    add_column :users, :mobile_number1, :string,   default: "", limit:20
    add_column :users, :mobile_number2, :string,   default: "", limit:20
    add_column :users, :birthdate, :date, null: true
    add_column :users, :occupation, :string,   default: ""
    add_column :users, :gender, :string,   default: "", limit:10
    add_column :users, :level, :integer,   default: 3, limit:3
    add_column :users, :country, :string, null: true
    add_column :users, :address, :text, null: true
  end
end
