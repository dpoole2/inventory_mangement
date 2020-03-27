class User < ApplicationRecord
    attr_accessor :password
    before_create :hash_password


    def self.authenticate(email,password)
		user = find_by_email(email.downcase)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
    end
    
    def hash_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = User.digest(password,password_salt)
		end
    end
    
    def User.digest(string, salt=nil)
		if !salt
			salt = BCrypt::Engine.generate_salt
		end
		hashed_string = BCrypt::Engine.hash_secret(string, salt)
	end 
end
