class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.references :user, index: true
      t.string :image
      t.integer :crop_x
      t.integer :crop_y
      t.integer :crop_w
      t.integer :crop_h

      t.timestamps
    end
  end
end
