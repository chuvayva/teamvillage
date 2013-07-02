task :hello do 
	puts 'Hello World!'
end

task :send_email => :environment do
	puts 'User.send_status_mail!'
	User.send_status_mail
end