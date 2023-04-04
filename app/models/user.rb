class User < ApplicationRecord
    
has_secure_password
has_many :reviews, dependent: :destroy
has_many :items, through: :reviews

PASSWORD_REQUIREMENTS = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%]).{8,24}\z/

validates :first_name, presence: { message: 'First name is required.'}
validates :last_name, presence: { message: 'Last name is required.'}
validates :access_type, presence: { message: 'Access type is required.'}
validates :terms_of_service, acceptance: { message: 'Terms must be abided.'}

validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Please enter a valid email."  }, uniqueness: { case_sensitive: false, message: ' An account with this email already exists.'}
validates :password, format: { with: PASSWORD_REQUIREMENTS, message: ' Use 8 to 24 characters with a mix of upper and lowercase letters, numbers & symbols.' }
    
end
