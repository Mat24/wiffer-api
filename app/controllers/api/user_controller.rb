class Api::UserController < ApplicationController
  def update
    render json: {paramettrs: params},status: :ok
  end

  def create
    new_user = User.new(user_params)
    new_user.password = params[:password]
    if new_user.save
      render text: "USER_CREATED"
    else
      render text: "ERROR! #{new_user.errors.messages}"
    end
  end

  def login
    @user = User.find_by_username(user_params[:username])
    puts @user
    if @user and @user.password == params[:password]
      render text: "AUTORIZADO: #{@user.new_session_token}"
    else
      render text: "ERROR LOGIN INVALIDO"
    end
  end

  def user_params
    params.permit(:username,:email,:nickname)
  end
end

