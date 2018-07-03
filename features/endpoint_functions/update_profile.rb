require 'rest-client'

def update_profile_info(user)
  user.firstName = 'firstNameUdated'
  user.lastName = 'lastNameUpdated'

    payload = {
      'firstName' => user.firstName,
      'lastName' => user.lastName
    }.to_json

  response = API.put('http://195.13.194.180:8090/api/profile',
                     headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                     cookies: {},
                     payload: payload)

  # Check if 200 OK is received
  assert_status_code(200, response, "Profile update")

  response_hash = JSON.parse(response)

  # Check if id is correct
  assert_equal(user.id, response_hash['id'], 'Ids dont match')

  # Check email is correct
  assert_equal(user.email, response_hash['email'], 'Email is not correct')

  # Check first name is correct
  assert_equal(user.firstName, response_hash['firstName'], 'First name is not correct')

  # Check last name is correct
    assert_equal(user.lastName, response_hash['lastName'], 'Last name is not correct')
end