class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy

    enum membersgender: [:men, :woman, :band]

    def to_s
        name
    end

    def concerts_count
        Concert.where(Group_id: id).count
    end

    def debut
        @concerts = Concert.where(Group_id: id)
        dates = []
        @concerts.each do |concert|
            dates.push(concert.concert_date)
        end
        dates.min
    end

    def total_asistants_over_time
        @concerts = Concert.where(Group_id: id)
        asistants = []
        @concerts.each do |concert|
            asistants.push(concert.participants)
        end
        asistants.sum
    end
end
