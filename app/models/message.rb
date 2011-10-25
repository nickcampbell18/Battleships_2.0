class Message < ActiveRecord::Base
  belongs_to :player
  default_scope :order => 'created_at DESC'
  validates_numericality_of :priority
  validates_length_of :text, :in => 1..200
end
