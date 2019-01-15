class Translation < ApplicationRecord
  belongs_to :allergy
  belongs_to :language
  has_many :user_translations

  scope :find_by_allergy_and_language, -> (allergy, language, message) {
    where("allergy_id = ? AND language_id = ? AND original_message = ?", allergy, language, message)
  }

  # scope :find_by_language_and_user, -> (language, user) {
  #   where("language_id = ? AND user_id = ?", language, user)
  # }
end
