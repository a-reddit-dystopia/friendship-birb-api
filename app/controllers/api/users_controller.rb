module Api
  class UsersController < ApiController
    def index
      users = User.where(status: 'active')
      render json: UserSerializer.new(users).serialized_json, status: 200
    end

    def create
      user = User.create(create_params)
      render json: UserSerializer.new(user).serialized_json, status: 201
    end

    def update
      user = User.find(params[:id])
      user.update(update_params)

      render json: UserSerializer.new(user).serialized_json, status: 200
    end

    protected

    def create_params
      params.require(:user).permit(:discord_name, :wow_name, :wow_server, :status, :status_date, :discord_id)
    end

    def update_params
      params.require(:user).permit(:status, :status_date)
    end
  end
end