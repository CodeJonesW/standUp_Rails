class StandupsController < ApplicationController
    def index
        @standups = Standup.all
        render json: @standups
    end

    def create
        @standup = Standup.create(s_params)
        standup = Standupserializer.new(@standup)
        render json: {standup: standup}
    end

    
    def show
        begin @standup = Standup.find(params[:id])
            render json: @standup
        rescue
            render json: {status: "error", code: 404, message: "Standup does not exist"}
        end
    end


    def destroy
       if  @standup = Standup.destroy(params[:id])
            standup = Standupserializer.new(@standup)
            render json: {standup: standup}
            # render json: {company: company}
       end
    end

    def update
        @standup = Standup.find(params[:id])
        if @standup.update(s_params)
            # standup = standupserializer.new(@standup)
            # render json: {standup: standup}
            standup = Standupserializer.new(@standup)
            render json: {standup: standup}
        else
            render json: @standup.errors, status: :unprocessable_entity
        end
    end


    private

    def s_params
        params.require(:standup).permit(:user_id, :team_id, :company_id, :yesterdeday, :today, :blocker)
    end
end
