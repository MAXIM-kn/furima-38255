class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: :edit
  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    if item.user == current_user
      item.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :condition_id, :shipping_cost_id, :shipping_area_id, :shipping_days_id,
                                 :price, :category_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if @item.purchase_record.present?
      redirect_to action: :index
    else
      unless @item.user == current_user
          redirect_to action: :index
      end
    end
  end

end
