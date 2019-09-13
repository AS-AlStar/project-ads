# frozen_string_literal: true

task :move_to_archive do
  Ad.new.from_published_to_archived
  puts "Ads move from  state 'published' to  state 'archived' successfully"
end
