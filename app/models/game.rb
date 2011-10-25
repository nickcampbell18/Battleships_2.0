class Game < ActiveRecord::Base
  has_many :players


  def generate_uuid
    self.uuid ||= rand(36**8).to_s(36)
  end
end
