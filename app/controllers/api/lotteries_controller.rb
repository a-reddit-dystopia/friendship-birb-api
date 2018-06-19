module Api
  class LotteriesController < ApiController
    def create
      user = User.where(status: 'active').order('RANDOM()').offset(1)
      lottery = Lottery.create(user_id: user.id)
      user.update(status: 'inactive', status_date: DateTime.current)

      render json: UserSerializer.new(user).serialized_json, status: 201
    end
  end
end