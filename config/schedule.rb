# frozen_string_literal: true

set :environment, 'development'

job_type :rake, 'cd :path && :environment_variable=:environment bundle exec rake :task :output'

every 1.day, at: '11:50 pm' do
  rake 'move_to_archive'
end

every 1.day, at: '12:00 am' do
  rake 'move_to_published'
end
