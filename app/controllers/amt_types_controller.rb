class AmtTypesController < ApplicationController
  def index
    @amt_types = AmtType.order(:title)
  end

  def new
     @amt_types = AmtType.new
  end

  def create
    @amt_types = AmtType.new(amt_types_params)

    if @amt_types.save
      redirect_to amt_types_path, 
        flash: {notice: "AmtType successfully added"}
    else
      render :new
    end
  end

  def edit
    @amt_types = AmtType.find(params[:id])
  end

  def update
    @amt_types = AmtType.find(params[:id])

    if @amt_types.update(amt_types_params)
      redirect_to amt_types_path, 
        flash: {notice: "AmtType successfully edited"}
    else
      render :edit
    end
  end

  def show
    @amt_types = AmtType.find(params[:id])
  end

  private

    def amt_types_params
      params.require(:amt_type).permit!
    end
end