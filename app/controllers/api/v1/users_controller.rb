class Api::V1::UsersController < ApplicationController
    def index 
        @users=User.all 

        render json: @users
    end

    def create
        @user = User.create(
            username: user_params["username"],
            password: user_params["password"] 
           
        )
        if @user.valid?
        render json: @user
        else  
        render json: {message: "Invalid username"}
        end   
    end

    def login
      @user = User.find_by(username: params[:username])
      #byebug
      if @user && @user.authenticate(params[:password])
        render json: @user
      else
        render json: {message: "Invalid username or password"}
      end
    end

    # def persist

    # end
 
    
private

 def user_params
    params.permit(:username, :password)
 end
   
end
