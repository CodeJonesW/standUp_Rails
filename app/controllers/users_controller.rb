class UsersController < ApplicationController
    
    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.create(u_params)
        user = UserSerializer.new(@user)
        render json: {user: user}
    end

    
    def show
        begin @user = User.find(params[:id])
            render json: @user
        rescue
            render json: {status: "error", code: 404, message: "Company does not exist"}
        end
    end


    def destroy
       if  @user = User.destroy(params[:id])
            user = UserSerializer.new(@user)
            render json: {user: user}
            # render json: {company: company}
       end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(u_params)
            # user = UserSerializer.new(@user)
            # render json: {user: user}
            user = UserSerializer.new(@user)
            render json: {user: user}
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end


    private

	def u_params
		params.require(:company).permit(:name, :about, :private, :location)
    end
end