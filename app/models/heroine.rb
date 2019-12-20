class Heroine < ApplicationRecord
    validates :super_name, uniqueness: true
    has_one :power
    def power
        Power.find(self.power_id)
    end
end
