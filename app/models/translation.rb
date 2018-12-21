class Translation < ApplicationRecord
  # validates :name, presence: true
  # validates :name, uniqueness: true
  # validates :message, presence: true

  belongs_to :allergy
  belongs_to :language
  has_many :user_translations
end
