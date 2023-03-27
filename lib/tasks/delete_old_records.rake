# lib/tasks/delete_old_records.rake
namespace :delete do
    desc 'Delete records older than 1 day'
    task :old_records => :environment do
      Cart.destroy_all('created_at > ?', 1.day.ago)
  
      # or Model.delete_all('created_at < ?', 60.days.ago) if you don't need callbacks
    end
  end