class Language < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :code, presence: true
  validates :code, uniqueness: true

  has_many :users

  scope :find_by_code, ->(input) { where("code ILIKE ?", "%#{input}%").first }
end
