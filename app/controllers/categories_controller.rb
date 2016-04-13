class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(name: params[:name])
  end

  def index
    @categories = Category.all
  end
  
end
