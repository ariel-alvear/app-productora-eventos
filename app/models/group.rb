class Group < ApplicationRecord
    has_many :concerts

    enum membersgender: [:men, :woman, :band]

    def to_s
        name
    end

    def concerts_count
        Concert.where(Group_id: id).count
    end
end
