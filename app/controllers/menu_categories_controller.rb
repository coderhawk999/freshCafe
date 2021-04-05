class MenuCategoriesController < ApplicationController
  def index
    adminAuth
    @menu_categories = MenuCategory.all
  end

  def new
    adminAuth
    @menu_category = MenuCategory.new
  end

  def create
    adminAuth
    if params[:is_active] == "Active"
      params[:is_active] = true
    else
      params[:is_active] = false
    end

    @menu_category = MenuCategory.new(menu_params)

    if @menu_category.save
      redirect_to menu_categories_path
    end
  end

  def edit
    adminAuth
    @menu_category = MenuCategory.find(params[:id])
  end

  def update
    adminAuth
    @menu_category = MenuCategory.find(params[:id])
    @menu_category.update(update_params)
    redirect_to menu_categories_path
  end

  def destroy
    adminAuth
    @menu_category = MenuCategory.find(params[:id])
    @menu_categories_items = @menu_category.menu_categories_items
    @menu_categories_items.destroy_all
    @menu_category.destroy
    redirect_to menu_categories_path
  end

  def updateStatus
    adminAuth
    @menu_category = MenuCategory.find(params[:id])
    @menu_category[:is_active] = !@menu_category[:is_active]
    @menu_category.update(menu_params)
    redirect_to menu_categories_path
  end

  private

  def update_params
    params.require(:menu_category).permit(:name)
  end

  def menu_params
    params.permit(:name, :is_active)
  end
end
