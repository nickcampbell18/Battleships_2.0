class Ship < ActiveRecord::Base
  belongs_to :player

  DIRECTIONS = ['S','E']
  HORIZ_RANGE = 'A'..'J'
  VERT_RANGE = 1..10
  SHIP_NAMES = {"Aircraft Carrier" => 6,
                             "Battleship" => 5,
                            "Destroyer" => 4,
                            "Submarine" => 3,
                            "Tiny Sub" => 2}

  validates :h, :length => { :in => 2..3},
                      :uniqueness => {:scope => :player_id}
  validates :v, :inclusion => {:in => DIRECTIONS}
  validates :l, :numericality => {:greater_than => 2, :less_than => 7}, #3,4,5,6
                     :uniqueness => {:scope => :player_id}
  validate :ensure_ship_placement
  validates_presence_of :h, :v, :l
  attr_readonly :h, :v, :l
  
  def ensure_ship_placement
    return false unless errors.empty? # Doesn't fail if other validation did
    col, row = cell_split(h)
    l.times.each do |i|
      (v == 'E' ? col.succ! : row = row.next) unless i == 0
      n = "#{col}#{row}"
      errors[:base] << 'Invalid ship placement' unless cell_valid?(n)
    end
  end

  def as_json(args={})
    super(:methods => [:cells, :name], :only => :h)
  end

  #private
  
  def cell_split(cell)
    col = cell.match(/[A-Z]+/).to_s
    row = cell.match(/[0-9]+/).to_s.to_i
    return col, row
  end
  
  def cell_valid?(cell)
    col, row = cell_split(cell)
    HORIZ_RANGE.member?(col) and VERT_RANGE.member?(row)
  end
  
  def cells
    used = []
    col, row = cell_split(h.to_s)
    l.to_i.times.each do |i|
      (v == 'E' ? col.succ! : row = row.next) unless i == 0
      n = "#{col}#{row}"
      used << n if cell_valid?(n)
    end
    return used
  end
  
  def name
   SHIP_NAMES.invert.fetch(l.to_i)
  end
    
end
