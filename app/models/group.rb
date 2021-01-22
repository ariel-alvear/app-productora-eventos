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

    def last_concert
        @concerts = Concert.where(Group_id: id)
        the_last_concert = @concerts.map { |concert| concert.concert_date }
        the_last_concert.max.strftime("%Y, %B, %A")
    end

    def max_participants_in_concert
        @concerts = Concert.where(Group_id: id)
        max_participants = @concerts.map { |concert| concert.participants }
        max_participants.max 
    end

    def max_concert_duration
        @concerts = Concert.where(Group_id: id)
        max_duration = @concerts.map { |concert| concert.duration }
        Time.at((max_duration.max)*60).utc.strftime("%H:%M:%S") #minutes to seconds, then to format HH:MM:SS
    end

end
