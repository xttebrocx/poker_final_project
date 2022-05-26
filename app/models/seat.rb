# == Schema Information
#
# Table name: seats
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#  user_id    :integer
#
class Seat < ApplicationRecord
end
