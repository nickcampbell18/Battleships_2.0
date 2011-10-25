class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :h
      t.string :v
      t.integer :l
      t.references :player
      t.timestamps
    end
  end
end
