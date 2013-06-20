Given /the following users exist\:/ do |users|
  users.hashes.each do |hash|
    User.create(hash)
  end
end


Given /^user with (.*) role$/ do |role|
  u = create :user
  u.roles = [role]
  u.save!
end

Given /^I am sign in as "([^"]+)" with password "([^"]+)"$/ do |name, password|
	user = User.find_by_name name
	user.should_not be_nil

	visit new_user_session_path
	fill_in "Email", :with => user.email
	fill_in "Password", :with => password
	click_button "Sign in"
end