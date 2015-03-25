class PrioritiesController < ApplicationController
  def index

    @priorities = Priority.order(:title)

  end

  def create

  end

  def new
    @priority = Priority.new
  end

  def update

  end

  def delete

  end

end
