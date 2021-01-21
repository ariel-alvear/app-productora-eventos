class Concert < ApplicationRecord
  belongs_to :Group

  def get_group_name
    self.Group.name
  end
end
