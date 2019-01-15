class Allergy < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :translations # ??? NOT SURE THIS IS NEEDED
  has_many :user_allergies

  mount_uploader :photo, PhotoUploader

  scope :search, -> (input) { where("name ILIKE ?", "%#{input}%").first || nil }
end
