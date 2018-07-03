require 'rest-client'

def login_positive(user)
  payload = {
      'email' => user.email,
      'password' => user.password
  }.to_json

  # response = RestClient::Request.execute(method: :post,
  #                                        url: 'http://195.13.194.180:8090/api/login' ,
  #                                        headers: {'Content-Type' => 'application/json'},
  #                                        cookies: {},
  #                                        payload: payload)

  response = API.post('http://195.13.194.180:8090/api/login',
                      headers: {'Content-Type' => 'application/json'},
                      cookies: {},
                      payload: payload)

  # Check if 200 OK is received
  # assert_equal(200, response.code, "Failed to log in. Response: #{response}") #old pirms assert_helper.rb
  assert_status_code(200, response, "Login")

  response_hash = JSON.parse(response)

  # Check if correct user is returned
  assert_equal(user.email, response_hash['email'], 'Logged in user is not correct')

  user.firstName = response_hash['firstName']
  user.lastName = response_hash['lastName']
  user.id = response_hash['id']
  user.auth_token = response.headers[:authorization]
end