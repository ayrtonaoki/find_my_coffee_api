class Api::V1::GoogleStoresController < ApplicationController
  def index
    google_store_list_service = GetGoogleStoreListService.new(params[:latitude], params[:longitude])
    stores = google_store_list_service.call

    render json: stores
  end
end
