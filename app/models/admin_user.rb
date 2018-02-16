# == Schema Information
#
# Table name: admin_users
#
#  id                  :integer          not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :inet
#  last_sign_in_ip     :inet
#  failed_attempts     :integer          default(0), not null
#  locked_at           :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class AdminUser < ApplicationRecord
  devise :database_authenticatable, :trackable, :lockable
end
