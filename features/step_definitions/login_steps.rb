Given (/^I have logged in as a regular user$/) do
  @user = User.new('reinis@email.com', 'parole123')
  login_positive(@user)
end