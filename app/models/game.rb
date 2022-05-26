# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  big_blind   :integer
#  game_bank   :integer
#  game_name   :string
#  game_owner  :integer
#  small_blind :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Game < ApplicationRecord
end
