class MenuCategoriesController < ApplicationController
  def index
    @menu_categories = MenuCategory.all
  end

  def new
    @menu_category = MenuCategory.new
  end

  def create
    @menu_category = MenuCategory.new(menu_params)

    if @menu_category.save
        redirect_to  menu_categories_path
    end

  end

  private

  def menu_params
    params.require(:menu_category).permit(:name, :is_active)
  end
end
