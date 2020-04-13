class API::V1::UsersController < ApplicationController

    def index
        @users = User.all 
        users_json = UserSerializer.new(@users).serialized_json
        render json: users_json
    end

    def create
        # binding.pry
        @user = User.new(user_params)
        if @user.save
            set_session
            render json: @user, status: :created

        else
            response = {
                error:@user.errors_full_messages.to_sentence
            }
            render json: response, status: :unprocessable_entity
    
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    
end
