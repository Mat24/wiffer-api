class Api::NetworksController < ApplicationController

  before_action :set_network, only: [:show,:update,:destroy]

  def index
    @networks = Network.all
  end

  def create
    network = Network.new(network_params)
    network.user = @current_user
    if network.save
      render text: "RED CREADA"
    else
      render text: "ERROR"
    end
  end

  def show
    # Renderiza @network previamente inicializada por el metodo set_network
  end

  def update
    if @network.update(network_params)
      render text: "RED ACTUALIZADA"
    else
      render text: "ERROR"
    end
  end

  def destroy
    if @network.destroy
      render text: "RED ELIMINADA"
    else
      render text: "ERROR"
    end
  end

  def set_network
    @network = Network.find(params[:id])
  end

  def network_params
    params.permit(:essid, :bssid, :band, :channel, :security_type, :is_wps, :longitude, :latitude, :first_seen, :last_seen, :user_id)
  end
end
