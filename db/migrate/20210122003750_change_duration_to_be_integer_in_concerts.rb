class ChangeDurationToBeIntegerInConcerts < ActiveRecord::Migration[6.1]
  def change
    change_column :concerts, :duration, :integer
  end
end
