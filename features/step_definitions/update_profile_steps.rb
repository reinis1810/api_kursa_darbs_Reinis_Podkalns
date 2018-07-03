Then (/^I update name and lastname$/) do
  puts @user.auth_token
  update_profile_info(@user)
end

Then (/^I check if profile is updated$/) do
  puts @user.auth_token
  check_profile_info(@user)
end

After do |scenario|
  if scenario.failed?
    user.firstName = 'firstName'
    user.lastName = 'lastName'

    payload = {
        'firstName' => user.firstName,
        'lastName' => user.lastName
    }.to_json

    response = API.put('http://195.13.194.180:8090/api/profile',
                       headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                       cookies: {},
                       payload: payload)
  end
end