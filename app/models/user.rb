require 'bcrypt'
class User < ActiveRecord::Base
  # Remember to create a migration!
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    if email == self.email && password == self.password
      self
    else
      nil
    end
  end
end
