class Answer < ApplicationRecord
  validates :name, :email, presence: true
  validates_email_format_of :email, :message => 'is not looking good 🤬'
  validates :answer_dinner, :answer_brunch, inclusion: { in: [true, false] }
end
