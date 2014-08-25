class Bankm < ActiveRecord::Base
  self.primary_key = :bank_cd
  has_many :banksms, foreign_key: [:bank_cd]
  accepts_nested_attributes_for :banksms
  attr_accessible :banksms_attributes
end
