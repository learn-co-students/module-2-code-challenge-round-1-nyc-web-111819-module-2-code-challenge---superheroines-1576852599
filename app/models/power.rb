class Power < ApplicationRecord
  has_many :heroines

  def self.all_sorted_abc_titlecase
    sorted = self.all.sort {|a,b| a.name <=> b.name}
    sorted.each do |power|
      power.name = power.name.titlecase
    end

  end
end
