class User < ApplicationRecord

    validates :email, presence: true, uniqueness: true
    validates :session_token, presence:true, uniqueness:true
    validates :password, length: {minimum: 6 }, allow_nil: true

    attr_reader :password
    after_initialize :ensure_session_token

    def reset_session_token!
        self.update!(session_token: SecureRandom.urlsafe_base64(16))
        self.save! #what is this part doing?
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    
    def self.find_by_credentials(email,password)
        user= User.find_by(email: email)  
        user && user.is_password?(password) ? user : nil
    end
 

end

