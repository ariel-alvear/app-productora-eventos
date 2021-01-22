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
        dates = @concerts.map { |concert| concert.concert_date }
        dates.min
    end

    def total_asistants_over_time
        @concerts = Concert.where(Group_id: id)
        asistants = @concerts.map { |concert| concert.participants }
        asistants.sum
    end

    def concerts_this_month
        @concerts = Concert.where(Group_id: id)
        concerts_month = []
        @concerts.each do |concert|
            if concert.concert_date > Time.now.beginning_of_month && concert.concert_date < Time.now.end_of_month
                concerts_month.push(concert.concert_date)
            end
        end
        concerts_month.count
    end

end
