class Heroine < ApplicationRecord
  belongs_to :power

  validates :name, :super_name, :power_id, presence: true
  validates :super_name, uniqueness: { case_sensitive: false }

  before_validation :capitalizer

  def capitalizer
    if self.name.split.size > 1
      self.name = self.name.split.map{|w| w.capitalize}.join(" ")
    else
      self.name = self.name.capitalize
    end
    
    if self.super_name.split.size > 1
      self.super_name = self.super_name.split.map{|w| w.capitalize}.join(" ")
    else
      self.super_name = self.super_name.capitalize
    end
  end

end
