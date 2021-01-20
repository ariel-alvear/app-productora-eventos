class Group < ApplicationRecord
    has_many :concerts

    enum membersgender: [:men, :woman, :band]

    def to_s
        name
    end
end
