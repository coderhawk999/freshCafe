class MenuCategoriesItemsController < ApplicationController
  def new
    adminAuth
    @menu_category = MenuCategory.find(params[:menu_category_id])
    @menu_category_item = @menu_category.menu_categories_items.build
  end

  def create
    adminAuth
    if params[:is_active] == "Active"
      params[:is_active] = true
    else
      params[:is_active] = false
    end
    @menu_category = MenuCategory.find(params[:menu_category_id])
    @menu_category_item = @menu_category.menu_categories_items.create(menu_items_params)
    redirect_to menu_categories_path
  end

  def edit
    adminAuth
    @menu_category = MenuCategory.find(params[:menu_category_id])
    @menu_category_item = @menu_category.menu_categories_items.find(params[:id])
  end

  def update
    adminAuth
    @menu_category = MenuCategory.find(params[:menu_category_id])
    @menu_category_item = @menu_category.menu_categories_items.find(params[:id])
    @menu_category_item.update(menu_items_params)
    redirect_to menu_categories_path
  end

  def destroy
    adminAuth
    @menu_category = MenuCategory.find(params[:menu_category_id])
    @menu_category_item = @menu_category.menu_categories_items.find(params[:id])
    @menu_category_item.destroy
    redirect_to menu_categories_path
  end

  private

  def menu_items_params
    params.require(:menu_categories_item).permit(:name, :price, :description, :menu_category_id, :is_available)
  end
end
