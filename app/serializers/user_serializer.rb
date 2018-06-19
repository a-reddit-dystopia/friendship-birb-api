class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :discord_name, :wow_name, :wow_server, :status, :status_date
end
