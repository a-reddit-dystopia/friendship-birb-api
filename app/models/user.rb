class User < ActiveRecord::Base
  validates :discord_id, uniqueness: true, on: :create
end