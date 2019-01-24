class Contact < ApplicationRecord
  validates :name, presence: { message: "Name must exist" }
  validates :name, uniqueness: { message: "You already have a contact with that name" }
  # validates :phone_number, presence: true
  # validates :relationship, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email must be a valid format" }
  validates_format_of :phone_number, with: /\A(\+|[0-9])[0-9]{9,17}\z/, message: "Phone number must be all numbers with no spaces. May contain a '+' if international number"

  # validates :phone_number, presence: { message: 'Phone number must be a valid format' }, numericality: { message: 'Phone number must contain only numbers' }, length: { minimum: 10, maximum: 15 }

  belongs_to :user
end
