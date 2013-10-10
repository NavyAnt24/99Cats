class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :age
      t.datetime :birth_day
      t.string :color
      t.string :name
      t.string :sex

      t.timestamps
    end
  end
end
