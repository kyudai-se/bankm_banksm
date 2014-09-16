class BankmForm < ActiveRecord::Base
#  include Virtus
#  extend ActiveModel::Naming
#  include ActiveModel::Conversion
#  include ActiveModel::Validations
  attribute :bank_cd, :bank_j

  def search
    scoped = Bankm.scoped
#    scoped = Bankm.where('bank_cd LIKE ?', "%#{bank_cd}%") if bank_cd.present?
    scoped = Bankm.where('bank_j LIKE ?',  "%#{bank_j}%" ) if bank_j.present?
    scoped
  end
end
