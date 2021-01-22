class Concert < ApplicationRecord
  belongs_to :Group

  def get_group_name
    self.Group.name
  end

  def to_s
    concert_date
  end
end
