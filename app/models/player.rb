class Player < ActiveRecord::Base
  belongs_to :game
  has_many :ships


  def generate_uuid
    self.uuid ||= rand(36**8).to_s(36)
  end
end
