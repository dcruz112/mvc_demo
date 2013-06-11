class CreateMammals < ActiveRecord::Migration
  def change
    create_table :mammals do |t|
      t.string :name
      t.string :netid
      t.integer :class_year

      t.timestamps
    end
  end
end
