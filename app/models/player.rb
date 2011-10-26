class Player < ActiveRecord::Base
  belongs_to :game
  has_many :ships
  has_many :messages

  serialize :fired_and_missed_shots, JSON
  serialize :fired_and_hit_shots, JSON
  serialize :occupied_and_lost_cells, JSON
  serialize :occupied_and_missed_cells, JSON

  attr_readonly :uuid

  after_initialize :generate_uuid

  validates :name, :length => { :in => 4..30 }
  validates :game_id, :presence => true
  
  validate :no_more_than_two_players

  def generate_uuid
    self.uuid ||= rand(36**8).to_s(36)
  end

  def as_json(params={})
    params.merge! :except => [:id,:created_at]
    super(params)
  end
  
  def no_more_than_two_players
    if !game.players.member?(self) #If you aren't already saved..
      errors[:base] << "There can only be two players" if game.players.count == 2
    end
  end
end
