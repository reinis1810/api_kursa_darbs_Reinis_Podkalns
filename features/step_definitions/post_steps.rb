Then (/^I create a new post$/) do
  @post = Post.new()
  create_new_post(@user2, @post)
end

Then(/^I check if the post is posted$/) do
  check_created_post(@user2, @post)
end

And(/^I update posts title$/) do
  update_post(@user, @post)
end