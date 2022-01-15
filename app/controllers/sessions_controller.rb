class SessionsController < ApplicationController
  # find_by returns front-end user object by params
  # try is built in Rails to build authentication, then authenticate
  def create
    user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end
  end
end
