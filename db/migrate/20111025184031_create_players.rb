class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :uuid
      t.references :game
      t.text :fired_and_missed_shots, :default => [].to_json
      t.text :fired_and_hit_shots, :default => [].to_json
      t.text :occupied_and_missed_cells, :default => [].to_json
      t.text :occupied_and_lost_cells, :default => [].to_json
      t.timestamps
    end
  end
end
