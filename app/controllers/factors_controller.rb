class FactorsController < ApplicationController

  def index

    @factors = Factor.includes(:dimention).order(dimention_id: :asc ,weight: :desc)

    if params[:keyword].present?
      q = params[:keyword]
      @factors = @factors.joins(:priority,:dimention)
        .where("priorities.title LIKE '%#{q}%' OR dimentions.title LIKE '%#{q}%' OR factor.title LIKE '%#{q}%'")
    end

    if request.xhr?
      render partial: "table", locals: {factors: @factors}
    end


  end

  def new
    @factor = Factor.new
  end

  def create
    @factor = Factor.new(factors_params)

    if @factor.save
      redirect_to factors_path,
        flash: {notice: "Factor successfully added"}
    else
      render :new
    end
  end


  def edit
    @factor = Factor.find(params[:id])
  end

  def update
    @factor = Factor.find(params[:id])

      if @factor.update(factors_params)
        redirect_to factors_path,
          flash: {notice: "Factor successfully edited"}
      else
        render :edit
      end
  end

  def destroy
    @factor = Factor.find(params[:id])

    @factor.destroy
    redirect_to factors_path, flash: {notice: "Factor successfully deleted"}

  end

  def show
    @factor = Factor.find(params[:id])
  end



  private
    def factors_params
      params.require(:factor).permit!
    end


end
