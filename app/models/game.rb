class Game < ActiveRecord::Base
  has_many :players
  after_initialize :generate_uuid
  attr_readonly :uuid
  validates :name, :length => { :in => 4..30 }

  def generate_uuid
    self.uuid ||= rand(36**8).to_s(36)
  end
  
  def as_json(params={})
    params.merge! :except => [:id,:created_at]
    super(params)
  end
end
