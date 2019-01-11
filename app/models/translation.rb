class Translation < ApplicationRecord
  belongs_to :allergy
  belongs_to :language
  has_many :user_translations

  scope :search, -> (allergy, language) { where("allergy_id = ? AND language_id = ?", allergy, language) }
end
