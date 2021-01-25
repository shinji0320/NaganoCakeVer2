class HomesController < ApplicationController
  def top
    @item = Item.limit(4).order("created_at DESC")
    @tax = 1.08
  end

  def about
  end
end
