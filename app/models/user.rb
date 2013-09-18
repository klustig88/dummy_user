class User < ActiveRecord::Base
  # Remember to create a migration!
  # validate: email: :unique
  include BCrypt

  def password
    password ||= Password.new(password_hash)
  end

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end

  def authenticate(secret)
    self.password == secret
  end
end
