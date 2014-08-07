require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'unindent'

if ENV['YO_API_TOKEN'] and ENV['YO_USER_NAME']
  RSpec::Core::RakeTask.new(:spec)
else
  task :spec do
    puts <<-EOS.unindent
      In the case of this gem, testing with stubbing network access has no meaning!
      First, execute
        export YO_USER_NAME='your_yo_username'
        export YO_API_TOKEN='your_yo_api_token'
      then execute `bundle exec rake spec` again!
    EOS
  end
end

task :default => :spec
