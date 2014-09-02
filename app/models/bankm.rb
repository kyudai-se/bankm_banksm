require 'nkf'
class Bankm < ActiveRecord::Base

  def self.search(search) #self.でクラスメソッドとしている
    if search
      Bankm.where(['bank_j LIKE ?', "%#{search}%"])
    else
      Bankm.all #全て表示。
    end
  end

  self.primary_key = :bank_cd
  has_many :banksms, foreign_key: [:bank_cd], dependent: :delete_all
  accepts_nested_attributes_for :banksms
  attr_accessible :banksms_attributes
  attr_accessible :entdate, :entmcn, :entclt, :edtdate, :edtmcn, :edtclt,
                  :bank_cd, :bank_j, :bank_a, :bank_k
  before_validation { self.bank_k  = NKF.nkf('-w -Z4 -x', bank_k) }
  validates :entmcn,  length: { maximum: 20 }
  validates :entclt,  length: { maximum: 20 }
  validates :edtmcn,  length: { maximum: 20 }
  validates :edtclt,  length: { maximum: 20 }
  validates :bank_cd, presence: true, uniqueness: true,
            numericality: { only_integer: true, less_than: 10000 }
  validates :bank_j,  presence: true, length: { maximum: 40 }, uniqueness: true,
            format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}A-Za-zＡ-Ｚ-ー]+\z/, allow_blank: true, message: 'はアルファベット、漢字、ひらがな、カタカナのいずれかで入力してください' }
  validates :bank_a,  presence: true, length: { maximum: 40 }, uniqueness: true,
            format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}A-Za-zＡ-Ｚ-ー]+\z/, allow_blank: true, message: 'はアルファベット、漢字、ひらがな、カタカナのいずれかで入力してください' } 
  validates :bank_k,  presence: true, length: { maximum: 40 }, uniqueness: true,
            format: { with: /\A[A-Za-zＡ-Ｚ\p{Katakana}\ﾞ\u30fc-]+\z/, allow_blank: true, message: 'はアルファベットかカタカナで入力してください' }
end
