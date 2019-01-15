class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language

  scope :search, -> (language, user) { where("language_id = ? AND user_id = ?", language, user) }
end
