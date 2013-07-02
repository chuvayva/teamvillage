# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every 1.minute do
  rake :send_email
  #command 'echo Hellow World'
end


# Learn more: http://github.com/javan/whenever
