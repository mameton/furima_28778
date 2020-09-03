class User < ApplicationRecord
  has_many :items
  has_many :pays
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :first_name_phonetic, presence: true
         validates :last_name_phonetic, presence: true
         validates :birthday, presence: true
     
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
     
         NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
         validates_format_of :first_name, with: NAME_REGEX
         validates_format_of :last_name, with: NAME_REGEX
     
         NAME_PHOTNETIC_REGEX = /\A[ァ-ヶー－]+\z/.freeze
         validates_format_of :first_name_phonetic, with: NAME_PHOTNETIC_REGEX
         validates_format_of :last_name_phonetic, with: NAME_PHOTNETIC_REGEX
end
