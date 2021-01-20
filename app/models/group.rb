class Group < ApplicationRecord
    has_many :concerts

    enum membersgender: [:men, :woman, :band]
end
