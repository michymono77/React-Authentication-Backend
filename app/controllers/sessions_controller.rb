class SessionsController < ApplicationController
  include CurrentUserConcern
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

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logged_out
    reset_sesssion
    render json: { status: 200, logged_out: true }
  end
end
