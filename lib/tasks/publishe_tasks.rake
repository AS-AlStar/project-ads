# frozen_string_literal: true

task :move_to_published do
  Ad.new.from_new_to_published
  puts "Ads move from state 'new' to state 'published' successfully"
end
