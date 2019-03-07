class Answer < ApplicationRecord
  validates :name, :email, presence: true
  validates_email_format_of :email, :message => 'is not looking good 🤬'
end
