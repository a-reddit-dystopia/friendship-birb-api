class User < ActiveRecord::Base
  validates :discord_id, uniqueness: scope: :status, on: :create
end