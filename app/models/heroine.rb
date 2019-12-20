class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true

  before_validation :names_titlecase

  def self.all_abc
    self.all.sort {|a,b| a.super_name <=> b.super_name}
  end

  def names_titlecase
    self.name = self.name.titlecase
    self.super_name = self.super_name.titlecase
  end
end
