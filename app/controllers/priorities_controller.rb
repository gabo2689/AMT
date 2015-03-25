class PrioritiesController < ApplicationController
  def index

    @priorities = Priority.order(weight: :desc)

  end

  def new
    @priority = Priority.new
  end

  def create


  end

  def update

  end

  def delete

  end

end
