class TeamController < ApplicationController
        def index
            @teams = Team.all
            render json: @teams
        end
    
        def create
            @team = Team.create(t_params)
            team = TeamSerializer.new(@team)
            render json: {team: team}
        end
    
        
        def show
            begin @team = Team.find(params[:id])
                render json: @team
            rescue
                render json: {status: "error", code: 404, message: "Team does not exist"}
            end
        end
    
    
        def destroy
           if  @team = Team.destroy(params[:id])
                team = TeamSerializer.new(@team)
                render json: {team: team}
                # render json: {company: company}
           end
        end
    
        def update
            @team = Team.find(params[:id])
            if @team.update(t_params)
                # team = teamSerializer.new(@team)
                # render json: {team: team}
                team = TeamSerializer.new(@team)
                render json: {team: team}
            else
                render json: @team.errors, status: :unprocessable_entity
            end
        end
    
    
        private
    
        def t_params
            params.require(:team).permit(:name, :company_id)
        end
    end
