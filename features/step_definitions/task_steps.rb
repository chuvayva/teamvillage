Given /^the following projects exist\:$/ do |projects|
  projects.hashes.each do |hash|
    user = User.find_by_name(hash.delete("owner"))
    proj = Project.create(hash)
    unless user.nil?
    	 proj.owner = user;
    	 proj.save!
    end
  end
end

# Given(/^the following projects exists:$/) do |table|
#   # table is a Cucumber::Ast::Table
#   pending # express the regexp above with the code you wish you had
# end