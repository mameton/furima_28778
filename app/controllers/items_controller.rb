class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

    def destroy
      item = Item.find(params[:id])
      if item.destroy
        redirect_to root_path
      else
        render :show
      end
    end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :price, :condition_id, :postage_id, :exhibitor_prefecture_id, :days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end


