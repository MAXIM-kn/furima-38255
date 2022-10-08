class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates_format_of :first_name, with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, presence: true
  validates_format_of :last_name, with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, presence: true
  validates_format_of :first_name_kana, with: /\A[ァ-ヶー－ー]+\z/, presence: true
  validates_format_of :last_name_kana, with: /\A[ァ-ヶー－ー]+\z/, presence: true
  validates :birth_day, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  has_many :items
end
