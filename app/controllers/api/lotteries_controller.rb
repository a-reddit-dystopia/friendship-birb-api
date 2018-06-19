module Api
  class LotteriesController < ApiController
    def create
      amount = params[:amount].to_i
      total = User.where(status: 'active').count

      amount > total ? amount = total : amount

      users = User.where(status: 'active').limit(amount).order("RANDOM()")
      if users.length > 0
        users.each do |user|
          lottery = Lottery.create(user_id: user.id)
          user.update(status: 'inactive', status_date: DateTime.current)
        end
        render json: UserSerializer.new(users).serialized_json, status: 201
      else
        render json: {error: 'no more drawings!'}, status: 422
      end
    end
  end
end