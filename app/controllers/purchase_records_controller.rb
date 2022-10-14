class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: :index

  def index
    @purchase_record_destination = PurchaseRecordDestination.new
  end

  def create
    @purchase_record_destination = PurchaseRecordDestination.new(purchase_record_destination)
      if @purchase_record_destination.valid?
        @purchase_record_destination.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_record_destination
    params.require(:purchase_record_destination).permit(:post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_root
    if @item.purchase_record.present?
      redirect_to root_path
    elsif 
      @item.user == current_user
      redirect_to root_path
    end
  end

end
