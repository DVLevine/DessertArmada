class CreateFoodMappings < ActiveRecord::Migration
  def change
    create_table :food_mappings do |t|
      t.float :biotin
      t.float :choline
      t.float :folate
      t.float :folic_acid
      t.float :niacin
      t.float :riboflavin
      t.float :thiamin
      t.float :vitamin_A
      t.float :vitamin_B12
      t.float :vitamin_B6
      t.float :vitamin_C
      t.float :vitamin_D
      t.float :vitamin_E
      t.float :vitamin_K
      t.float :panto_acid
      t.integer :calories
      t.integer :fatCalories
      t.float :fiber
      t.float :protein

      t.timestamps
    end
  end
end
