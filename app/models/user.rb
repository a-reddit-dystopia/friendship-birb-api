class User < ActiveRecord::Base
  validates :discord_id, uniqueness: { scope: [:wow_name, :wow_server, :status]}, on: :create
end