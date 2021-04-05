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

  def updateStatus
    adminAuth
    @menu_category = MenuCategory.find(params[:id])
    @menu_category[:is_active] = !@menu_category[:is_active]
    @menu_category.update(menu_params)
    redirect_to menu_categories_path
  end

  private

  def menu_params
    params.permit(:name, :is_active)
  end
end
