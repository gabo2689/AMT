class PrioritiesController < ApplicationController
  def index

    @priorities = Priority.order(weight: :desc)

  end

  def new
    @priority = Priority.new
  end

  def create
    @priority = Priority.new(priorities_params)

    if @priority.save
      redirect_to priorities_path,
        flash: {notice: "Priority successfully added"}
    else
      render :new
    end
  end


  def edit
    @priority = Priority.find(params[:id])
  end

  def update
    @priority = Priority.find(params[:id])

      if @priority.update(priorities_params)
        redirect_to priorities_path,
          flash: {notice: "Priority successfully edited"}
      else
        render :edit
      end
  end

  def destroy
    @priority = Priority.find(params[:id])

    @priority.destroy
    redirect_to priorities_path, flash: {notice: "Priority successfully deleted"}

  end

  def show
    @priority = Priority.find(params[:id])
  end



  private
    def priorities_params
      params.require(:priority).permit!
    end


end
