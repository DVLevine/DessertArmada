class AddHealthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :bmr, :float
    add_column :users, :gender, :integer
    add_column :users, :height, :float
    add_column :users, :weight, :float
  end
end
