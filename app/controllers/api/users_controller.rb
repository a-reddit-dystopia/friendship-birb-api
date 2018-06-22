module Api
  class UsersController < ApiController
    def index
      users = User.where(status: 'active')
      render json: UserSerializer.new(users).serialized_json, status: 200
    end

    def create
      user = User.new(create_params)
      if user.save
        render json: UserSerializer.new(user).serialized_json, status: 201
      else
        render json: {error: "duplicate!" }, status: 422
      end
    end

    def update
      user = User.find(params[:id])
      user.update(update_params)

      render json: UserSerializer.new(user).serialized_json, status: 200
    end

    def destroy
      user = User.where(status: 'active').find_by_discord_id(params[:discord_id])

      if user.destroy
        render json: {status: 'ok'}, status: 200
      else
        render json: {error: 'uh oh' }, status: 404 
      end

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