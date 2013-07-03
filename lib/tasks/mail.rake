task :hello do 
	puts 'Hello World!'
end

desc 'send status email'
task :send_email => :environment do
	puts 'Sending status mail to users...'

	User.send_status_mail

	puts 'Done.'
end

desc 'send status email only on sunday'
task :send_email_on_sunday => :environment do
	if Time.now.sunday?
		Rake::Task['send_email'].invoke
	end
end