require "bcrypt"
class User < ActiveRecord::Base

has_one_time_password


 def password
        @password 
 end

    # this method passes the user's password to BCrypt creating the password_digest that is saved in the database
    def password=(new_password)
        @password = new_password
        self.password_digest = BCrypt::Password.create(new_password)
    end

    # this method tests the user's password against the user's entered password to authenticate the password upon logging in
    def authenticate(test_password)
        if BCrypt::Password.new(self.password_digest) == test_password
            self
        else
            false
        end
    end

end
