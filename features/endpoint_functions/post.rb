def create_new_post(user, post)
  payload = {
      'content' => 'randomContent' + Time.now.utc.to_i.to_s,
      'title' => 'randomTitle' + Time.now.utc.to_i.to_s
  }.to_json

  response = API.post('http://195.13.194.180:8090/api/post',
                      headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                      cookies: {},
                      payload: payload)

  assert_status_code(200, response, "Post created")

  response_hash = JSON.parse(response)

  post.id = response_hash['id']
  post.content = response_hash['content']
  post.title = response_hash['title']
  post.titleUpdated = response_hash['title']
end

def check_created_post(user, post)
  response = API.get("http://195.13.194.180:8090/api/post?id=#{post.id}",
                     headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                     cookies: {})

  assert_status_code(200, response, "Post is created")

  response_hash = JSON.parse(response)

  assert_equal(post.content, response_hash['content'], 'Content is not correct')
  assert_equal(post.title, response_hash['title'], 'Title is not correct')
end

def update_post(user, post)
  post.titleUpdated = 'randomTitleUpdated' + Time.now.utc.to_i.to_s

  payload = {
      'title' => post.titleUpdated
  }.to_json

  response = API.put("http://195.13.194.180:8090/api/post?post_id=#{post.id}",
                     headers: {'Content-Type' => 'application/json', 'Authorization' => user.auth_token},
                     cookies: {},
                     payload: payload)

  assert_status_code(403, response, "Post cannot be updated")
end