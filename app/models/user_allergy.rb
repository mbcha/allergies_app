class UserAllergy < ApplicationRecord
  belongs_to :user
  belongs_to :allergy

  scope :search, -> (allergy, user) { where("allergy_id = ? AND user_id = ?", allergy, user)[0] }
end
