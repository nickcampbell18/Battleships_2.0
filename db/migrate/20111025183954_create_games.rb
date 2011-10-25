class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :uuid
      t.boolean :started, :default => false

      t.timestamps
    end
  end
end
