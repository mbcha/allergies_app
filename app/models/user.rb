class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :message, presence: true
  # validates_numericality_of :country_id, allow_nil: true

  has_many :user_countries, dependent: :destroy
  has_many :user_allergies, dependent: :destroy
  has_many :user_translations, dependent: :destroy
  has_many :contacts, dependent: :destroy

  belongs_to :language, optional: true
  belongs_to :country, optional: true
end
