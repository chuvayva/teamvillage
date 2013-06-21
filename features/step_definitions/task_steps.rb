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

Given /^the following tasks exist\:$/ do |projects|
  projects.hashes.each do |hash|
    project = Project.find_by_name(hash.delete("project"))
    task = Task.create(hash)
    unless project.nil?
    	 task.project = project;
    	 task.save!
    end
  end
end

When(/^follow "(.*?)" button on "(.*?)" task$/) do |action, name|
  all('tr').each do |row|
    if row.has_content? name
      row.click_link action
    end
  end
end