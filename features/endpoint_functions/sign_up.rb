require 'rest-client'

def sign_up_positive
  payload = {
      'email' => 'dummy@email.com',
      'firstName' => 'Dummy',
      'lastName' => 'Yes',
      'password' => 'parole123'
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/sign-up',
                      headers: {'Content-Type' => 'application/json'},
                      cookies: {},
                      payload: payload)

  # Check if 200 OK is received
  assert_status_code(200, response, "Sign up")
end