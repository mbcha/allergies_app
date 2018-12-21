class Country < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :language_code, presence: true

  has_many :user_countries
end
