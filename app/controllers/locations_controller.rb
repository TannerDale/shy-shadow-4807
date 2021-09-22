class LocationsController < ApplicationController
  def destroy
    location = Location.find(params[:id])
    location.destroy

    redirect_to plots_path
  end
end
