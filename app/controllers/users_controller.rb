class UsersController < ApplicationController
  skip_before_action :require_login, only [:create]
  
  def create
    @user = User.create(user_params)
    if user.valid?
      payload = {user_id: user.id}
      token = encode_token(payload)
      render json : {
        user: user,
        jwt: token
      }
    else
      render json : {
        errors: user.errors.full_messages,
        status: :not_acceptable
      }
    end

    # if @user.save
    #   login!
    #   render json: {
    #     status: :created,
    #     user: @user
    #   }
    # else
    #   render json: {
    #     status: 500,
    #     errors: @user.errors.full_messages
    #   }
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
