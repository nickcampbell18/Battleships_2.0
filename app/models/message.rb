class Message < ActiveRecord::Base
  belongs_to :player
  default_scope :order => 'created_at DESC'
end
