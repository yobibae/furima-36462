class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :orders

  validates :nickname, presence: true
  validates :email, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
  HIRAGANA_KATAKANA_KANJI_REGEXP = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name, presence: true, format: { with: HIRAGANA_KATAKANA_KANJI_REGEXP }
  validates :first_name, presence: true, format: { with: HIRAGANA_KATAKANA_KANJI_REGEXP }
  KATAKANA_REGEXP = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, presence: true, format: { with: KATAKANA_REGEXP }
  validates :first_name_kana, presence: true, format: { with: KATAKANA_REGEXP }
  validates :birth_date, presence: true
end
