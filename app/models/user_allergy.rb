class UserAllergy < ApplicationRecord
  belongs_to :user
  belongs_to :allergy

  scope :find_by_allergy, -> (allergy, user) { where("allergy_id = ? AND user_id = ?", allergy, user) }
end
