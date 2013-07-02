And /^the "(.+)" job exists$/ do |name|
  require "rake"
  @rake = Rake::Application.new
  Rake.application = @rake
  Rake.application.rake_require "lib/tasks/#{name}", [Rails.root.to_s]
end

And /^the "(.+)" job has fired$/ do |task|
  Rake::Task[task].invoke
end