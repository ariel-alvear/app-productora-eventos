class Group < ApplicationRecord
    has_many :concerts, dependent: :destroy

    enum membersgender: [:men, :woman, :band]
    
    validates :members, presence: true
    validates :membersgender, presence: true
    validates :name, presence: true
    validates :members, :numericality => { :greater_than => 0 }
    
    def to_s
        name
    end

    def concerts_count
        Concert.where(Group_id: id).count
    end

    def debut
        @concerts = Concert.where(Group_id: id)
        dates = @concerts.map { |concert| concert.concert_date }
        if dates.any?
            dates.min
        else
            "This band don't have concerts"
        end
    end

    def total_asistants_over_time
        @concerts = Concert.where(Group_id: id)
        asistants = @concerts.map { |concert| concert.participants }
        if asistants.any?
            asistants.sum
        else
            "This band don't have concerts"
        end
    end

    def concerts_this_month
        @concerts = Concert.where(Group_id: id)
        concerts_month = []
        @concerts.each do |concert|
            if concert.concert_date > Time.now.beginning_of_month && concert.concert_date < Time.now.end_of_month
                concerts_month.push(concert.concert_date)
            end
        end
        if concerts_month.any?
            concerts_month.count
        else
            "This band don't have concerts this month"
        end
    end

    def last_concert
        @concerts = Concert.where(Group_id: id)
        the_last_concert = @concerts.map { |concert| concert.concert_date }
        if the_last_concert.any?
            the_last_concert.max.strftime("%Y, %B, %A")
        else
            "This band don't have concerts"
        end
    end

    def max_participants_in_concert
        @concerts = Concert.where(Group_id: id)
        max_participants = @concerts.map { |concert| concert.participants }
        if max_participants.any?
            max_participants.max 
        else
            "This band don't have concerts"
        end
    end

    def max_concert_duration
        @concerts = Concert.where(Group_id: id)
        max_duration = @concerts.map { |concert| concert.duration }
        if max_duration.any?
            Time.at((max_duration.max)*60).utc.strftime("%H:%M:%S") #minutes to seconds, then to format HH:MM:SS
        else
            "This band don't have concerts"
        end
    end

end
