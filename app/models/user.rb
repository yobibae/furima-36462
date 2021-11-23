class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :orders

  validates :nickname, presence: true
  validates :email, presence: true, allow_blank: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true
  HIRAGANA_KATAKANA_KANJI_REGEXP = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :last_name, presence: true, format: { with: HIRAGANA_KATAKANA_KANJI_REGEXP, allow_blank: true }
  validates :first_name, presence: true, format: { with: HIRAGANA_KATAKANA_KANJI_REGEXP, allow_blank: true }
  KATAKANA_REGEXP = /\A[ァ-ヶー]+\z/
  validates :last_name_kana, presence: true, format: { with: KATAKANA_REGEXP, allow_blank: true }
  validates :first_name_kana, presence: true, format: { with: KATAKANA_REGEXP, allow_blank: true }
  validates :birth_date, presence: true
end
