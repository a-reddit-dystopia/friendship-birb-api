class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :discord_name, :discord_id, :wow_name, :wow_server, :status, :status_date
end
