require 'nkf'
class Aream < ActiveRecord::Base

before_validation { self.area_k  = NKF.nkf('-w -Z4 -x', area_k) }
validates :entmcn,  length: { maximum: 20 }
validates :entclt,  length: { maximum: 20 }
validates :edtmcn,  length: { maximum: 20 }
validates :edtclt,  length: { maximum: 20 }
validates :area_cd, presence: true, length: { maximum: 04 }, uniqueness: true,
          numericality: true
validates :area_j,  presence: true, length: { maximum: 40 }, uniqueness: true,
          format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/, allow_blank: true, message: 'は漢字、ひらがな、カタカナのいずれかで入力してください' }
validates :area_a,  presence: true, length: { maximum: 40 }, uniqueness: true,
          format: { with: /\A[\p{Han}\p{Hiragana}\p{Katakana}]+\z/, allow_blank: true, message: 'は漢字、ひらがな、カタカナのいずれかで入力してください' } 
validates :area_k,  presence: true, length: { maximum: 40 }, uniqueness: true,
          format: { with: /\A[\p{Katakana}\ﾞ\u30fc]+\z/, allow_blank: true, message: 'はカタカナで入力してください' }
end
