class Concert < ApplicationRecord
  belongs_to :Group

  validates :participants, presence: true
  validates :duration, presence: true
  validates :concert_date, presence: true
  validates :Group_id, presence: true
  validates :participants, :numericality => { :greater_than_or_equal_to => 0 }
  validates :duration, :numericality => { :greater_than_or_equal_to => 0 }
  
  def get_group_name
    self.Group.name
  end

  def to_s
    concert_date
  end
  
end
