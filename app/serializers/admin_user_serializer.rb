class AdminUserSerializer < ActiveModel::Serializer
attributes :id, :first_name, :last_name, :access_type, :email
end
