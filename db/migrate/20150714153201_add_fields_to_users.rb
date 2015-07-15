class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :mobile_number1, :string, null: false, default: "", limit:20
    add_column :users, :mobile_number2, :string, null: false, default: "", limit:20
    add_column :users, :birthdate, :date, null: false
    add_column :users, :occupation, :string, null: false, default: ""
    add_column :users, :gender, :string, null: false, default: "", limit:10
    add_column :users, :level, :integer, null: false, default: 3, limit:3
  end
end
