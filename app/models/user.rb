class User < ApplicationRecord
  has_secure_password

  # Model associations
  has_many :tweets, foreign_key: :created_by
  # Validations
  validates_presence_of :name, :email, :password_digest
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: 'is invalid' }
  validates_format_of :email,
                      with: /((?!\.)[a-z0-9._%+-]+(?!\.)\w)@andela\.com/,
                      message: 'should be of andelan domain'
end
