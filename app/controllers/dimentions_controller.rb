class DimentionsController < ApplicationController

  def index

    @dimentions = Dimention.includes(:priority).order(priority_id: :asc ,weight: :desc)

    if params[:keyword].present?
      q = params[:keyword]
      @dimentions = @dimentions.joins(:priority)
        .where("priorities.title LIKE '%#{q}%' OR dimentions.title LIKE '%#{q}%'")
    end

    if request.xhr?
      render partial: "table", locals: {dimentions: @dimentions}
    end


  end

  def new
    @dimention = Dimention.new
  end

  def create
    @dimention = Dimention.new(dimentions_params)

    if @dimention.save
      redirect_to dimentions_path,
        flash: {notice: "Priority successfully added"}
    else
      render :new
    end
  end


  def edit
    @dimention = Dimention.find(params[:id])
  end

  def update
    @dimention = Dimention.find(params[:id])

      if @dimention.update(dimentions_params)
        redirect_to dimentions_path,
          flash: {notice: "Priority successfully edited"}
      else
        render :edit
      end
  end

  def destroy
    @dimention = Dimention.find(params[:id])

    @dimention.destroy
    redirect_to dimentions_path, flash: {notice: "Priority successfully deleted"}

  end

  def show
    @dimention = Dimention.find(params[:id])
  end



  private
    def dimentions_params
      params.require(:dimention).permit!
    end

end
