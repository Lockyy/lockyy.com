class AdminUser < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :lockable
end
