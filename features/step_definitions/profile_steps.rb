Then (/^I can access my profile information$/) do
  puts @user.auth_token
  check_profile_info(@user)
end