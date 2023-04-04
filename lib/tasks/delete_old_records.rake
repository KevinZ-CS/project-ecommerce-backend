# lib/tasks/delete_old_records.rake
namespace :delete do
    desc 'Delete records older than 1 day'
    task old_records: :environment do
      Cart.where('created_at < ?', 1.days.ago).each do |instance|
      instance.destroy
      end
    end
end