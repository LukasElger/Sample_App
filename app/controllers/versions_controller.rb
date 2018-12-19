class VersionsController < ApplicationController

  def version
    @items = PaperTrail::Version.where(item_type: params[:item_type].capitalize, item_id: params[:item_id])
  end
end
