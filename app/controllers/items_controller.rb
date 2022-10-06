class ItemsController < ApplicationController
  def index
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



  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:shipping_fee_id,:description,:prefecture_id,:delivery_date_id,:price,:image).merge(user_id: current_user.id)
  end
end