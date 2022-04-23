class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :purchases

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}, presence: true
  validates :family_name,  format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}, presence: true
  validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}, presence: true
  validates :family_name_kana,  format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}, presence: true
  validates :birthday, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, presence: true


end
