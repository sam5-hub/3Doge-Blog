class User < ApplicationRecord
	has_many :articles
    before_save {self.email = email.downcase}
    has_secure_password
    validates   :username, presence: true,
                length: {minimum: 1, maximum: 25},
                uniqueness: { case_sensetive: false }

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates   :email, presence: true,
                length: {maximum: 120},
                uniqueness: { case_sensetive: false },
                format: { with: VALID_EMAIL_REGEX }

end
