class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :home
      t.string :vector
      t.string :length
      t.references :player
      t.timestamps
    end
  end
end
