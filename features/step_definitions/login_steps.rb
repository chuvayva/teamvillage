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

# Given /the following users exist\:/ do |movie_table|
#   # movie_table.hashes.each do |hash|
#   #   Movie.create(hash)
#   # end
# end
