class TechnologiesController < ApplicationController
  def index
    @technology = Technology.includes(:amt_type).order(:title)

    if params[:keyword].present?
      q = params[:keyword]
        .where("technologies.title LIKE '%#{q}%'")
    end

    if request.xhr?
      render partial: "table", locals: {technologies: @technology}
    end
  end

  def new
     @technology = Technology.new
  end

  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      redirect_to technology_path, 
        flash: {notice: "Technology successfully added"}
    else
      render :new
    end
  end

  def edit
    @technology = Technology.find(params[:id])
  end

  def update
    @technology = Technology.find(params[:id])

    if @technology.update(technology_params)
      redirect_to technology_path, 
        flash: {notice: "Technology successfully edited"}
    else
      render :edit
    end
  end

  def show
    @technology = Technology.find(params[:id])
  end

  private

    def technology_params
      params.require(:amt_type).permit!
    end
end