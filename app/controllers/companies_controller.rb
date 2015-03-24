class CompaniesController < ApplicationController
  def index
    @companies = Company.order(:name)
  end

  def new
     @companies = Company.new
  end

  def create
    @companies = Company.new(companies_params)

    if @companies.save
      redirect_to companies_path, 
        flash: {notice: "Company successfully added"}
    else
      render :new
    end
  end

  def edit
    @companies = Company.find(params[:id])
  end

  def update
    @companies = Company.find(params[:id])

    if @companies.update(companies_params)
      redirect_to companies_path, 
        flash: {notice: "Company successfully edited"}
    else
      render :edit
    end
  end

  private

    def companies_params
      params.require(:company).permit(:name)
    end
end
