Given (/^I have logged in as a regular user$/) do
  @user = User.new('reinis@email.com', 'parole123')
  login_positive(@user)
end

Given (/^I have logged in as a new regular user$/) do
  @user2 = User.new('dummy@email.com', 'parole123')
  login_positive(@user2)
end