# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  current_game    :integer
#  email           :string
#  password_digest :string
#  user_bank       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
