class AmtCommentsController < ApplicationController  
  def index
    @amt_comments = AmtComment.order(created_at: :desc)
  end

  def new
     @amt_comments = AmtComment.new
  end

  def create
    @amt_comments = AmtComment.new(amt_comments_params)

    if @amt_comments.save
      redirect_to amt_types_path, 
        flash: {notice: "AmtComment successfully added"}
    else
      render :new
    end
  end

  def edit
   @amt_comments = AmtComment.find(params[:id])
  end

  def update
    @amt_comments = AmtComment.find(params[:id])

    if @amt_comments.update(amt_comments_params)
      redirect_to amt_comments_path, 
        flash: {notice: "AmtComment successfully edited"}
    else
      render :edit
    end
  end

  private

    def amt_comments_params
      params.require(:amt_comment).permit!
    end
end
