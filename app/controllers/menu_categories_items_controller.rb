class MenuCategoriesItemsController < ApplicationController
  def new
    @menu_category = MenuCategory.find(params[:menu_category_id])
    @menu_category_item = @menu_category.menu_categories_items.build
  end

  def create
    @menu_category = MenuCategory.find(params[:menu_category_id])
    @menu_category_item = @menu_category.menu_categories_items.create(menu_items_params)
    redirect_to menu_categories_path
  end

  private

  def menu_items_params
    params.require(:menu_categories_item).permit(:name, :price, :description, :menu_category_id, :is_available)
  end
end
