class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new( category_params )
    if @category.save
      redirect_to categories_path, flash: { notice: "Thanks for your submission!" }
    else
      flash.now[:error] = @category.errors.full_messages
      render :new
    end
  end

  def update
    if @category.update category_params
       redirect_to category_path, flash: { notice: "Your category has been updated." }
    else
      flash.now[:error] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path, flash: { notice: "Category Destroyed" }
    else
      flash.now[:error] = @category.errors.full_messages
      render :index
    end
  end
  private ##########################################################################################

  def category_params
    params.require(:category).permit( :name, :title, :description, :sidebar, :submission_text )
  end

  def find_category
    @category = Category.find params[:id]
  end
end
