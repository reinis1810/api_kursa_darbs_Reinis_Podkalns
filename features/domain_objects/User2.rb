class User
  attr_accessor :id, :email, :firstName, :lastName, :password, :auth_token

  def initialize(email, password)
    self.email = email;
    self.password = password;
  end
end