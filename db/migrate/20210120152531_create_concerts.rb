class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.integer :participants
      t.time :duration
      t.date :concert_date
      t.belongs_to :Group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
