class CreateAdminUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :access_type
      t.string :email
      t.boolean :terms_of_service
      t.string :password_digest

      t.timestamps
    end
  end
end
