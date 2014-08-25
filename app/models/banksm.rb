class Banksm < ActiveRecord::Base
  self.primary_key = :bank_cd, :banks_cd, :banks_ed
  belongs_to :bankm,foreign_key: :bank_cd, primary_key: :banc_cd
end
