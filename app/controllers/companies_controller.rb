class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all
        render json: @companies
    end

    def create
        @company = Company.create(c_params)
        company = UserSerializer.new(@company)
        render json: {company: company}
    end

    
    def show
        begin @company = Company.find(params[:id])
            render json: @company
        rescue
            render json: {status: "error", code: 404, message: "Company does not exist"}
        end
    end


    def destroy
       if  @company = Company.destroy(params[:id])
            company = CompanySerializer.new(@company)
            # render json: {company: company}
       end
    end

    def update
        @company = Company.find(params[:id])
        if @company.update(c_params)
            # user = UserSerializer.new(@user)
            # render json: {user: user}
            company = CompanySerializer.new(@company)
            render json: {company: company}
        else
            render json: @company.errors, status: :unprocessable_entity
        end
    end


    private

	def c_params
		params.require(:company).permit(:name, :about, :private, :location)
    end
end
