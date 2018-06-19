module Api
  class LotteriesController < ApiController
    def create
      user = User.where(status: 'active').limit(1).order("RANDOM()").first
      if user.present?
        lottery = Lottery.create(user_id: user.id)
        user.update(status: 'inactive', status_date: DateTime.current)

        render json: UserSerializer.new(user).serialized_json, status: 201
      else
        render json: {error: 'no more drawings!'}, status: 422
      end
    end
  end
end