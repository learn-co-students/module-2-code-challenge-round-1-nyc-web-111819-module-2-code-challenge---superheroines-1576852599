class Heroine < ApplicationRecord
    belongs_to :power

    validates :super_name, presence: true
    validates :super_name, uniqueness: true

    # def self.filter(filter)
    #     if filter
    #       where(power_id: filter)
    #     end
    #   end
end
