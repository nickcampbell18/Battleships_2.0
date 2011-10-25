class Ship < ActiveRecord::Base
  belongs_to :player

  DIRECTIONS = ['S','E']

  validates :home, {:length => { :in => 2..3},
                              :uniqueness => {:scope => :player_id}}
  validates :vector, :inclusion => {:in => DIRECTIONS}
  validates :length, {:numericality => {:greater_than => 2, :less_than => 7},
                                :uniqueness => {:scope => :player_id}}

  attr_readonly :home, :vector, :length
end
