class Api::V1::GoogleStoresController < ApplicationController
  def index
    google_store_list_service = GetGoogleStoreListService.new(params[:latitude], params[:longitude])
    store_list = google_store_list_service.call

    render json: store_list
  end

  def show
    google_store_details_service = GetGoogleStoreDetailsService.new(params[:id])
    store_details = google_store_details_service.call

    render json: store_details
  end
end
