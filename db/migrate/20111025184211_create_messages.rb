class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text
      t.integer :priority
      t.references :player
      t.timestamps
    end
  end
end
