require 'nkf'
class Banksm < ActiveRecord::Base
  self.primary_key = :bank_cd, :banks_cd, :banks_ed
  belongs_to :bankm,foreign_key: :bank_cd, primary_key: :banc_cd

  before_validation { self.banks_k  = NKF.nkf('-w -Z4 -x', banks_k) } 
   validates :entmcn,  length: { maximum: 20 } 
   validates :entclt,  length: { maximum: 20 } 
   validates :edtmcn,  length: { maximum: 20 } 
   validates :edtclt,  length: { maximum: 20 } 
   validates :bank_cd, presence: true, 
             numericality: { only_integer: true, less_than: 10000 } 
  validates :banks_cd, presence: true, uniqueness: true,
             numericality: { only_integer: true, less_than: 10000 }
  validates :banks_ed, presence: true, uniqueness: true,
             numericality: { only_integer: true, less_than: 10000 }
   validates :banks_j,  presence: true, length: { maximum: 40 }, uniqueness: true, 
             format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}A-Za-zＡ-Ｚ-ー]+\z/, allow_blank: true, message: 'はアルファベット、漢字、ひらがな、カタカナのいずれかで入力してください' } 
   validates :banks_a,  presence: true, length: { maximum: 40 }, uniqueness: true, 
             format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}A-Za-zＡ-Ｚ-ー]+\z/, allow_blank: true, message: 'はアルファベット、漢字、ひらがな、カタカナのいずれかで入力してください' }  
   validates :banks_k,  presence: true, length: { maximum: 40 }, uniqueness: true, 
             format: { with: /\A[A-Za-zＡ-Ｚ\p{Katakana}\ﾞ\u30fc-]+\z/, allow_blank: true, message: 'はアルファベットかカタカナで入力してください' }
end
