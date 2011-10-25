class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text
      t.integer :priority, :default => 0
      t.references :player
      t.timestamps
    end
  end
end
