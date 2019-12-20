class Heroine < ApplicationRecord
    validates_uniqueness_of :super_name
    belongs_to :power
end
