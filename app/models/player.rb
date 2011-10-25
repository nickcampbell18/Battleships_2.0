class Player < ActiveRecord::Base
  belongs_to :game
  has_many :ships

  serialize :fired_and_missed_shots, JSON
  serialize :fired_and_hit_shots, JSON
  serialize :occupied_and_lost_cells, JSON
  serialize :occupied_and_missed_cells, JSON

  attr_readonly :uuid

  after_initialize :generate_uuid

  validates :name, {:presence => true, :length => { :in => 4..30 }}
  validates :game_id, :presence => true

  def generate_uuid
    self.uuid ||= rand(36**8).to_s(36)
  end
end
