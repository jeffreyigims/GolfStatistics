module Api::V1
  class PlayersController < ApplicationController
    # Start with swagger docs info
    swagger_controller :players, "Player Management"

    swagger_api :index do
      summary "Fetches all Player objects"
      notes "This lists all the players"
    end

    swagger_api :show do
      summary "Shows one Player object"
      param :path, :id, :integer, :required, "Player Identification"
      notes "This lists details of one player"
      response :not_found
    end

    swagger_api :create do
      summary "Creates a new Player"
      param :form, :first_name, :string, :required, "First Name"
      param :form, :last_name, :string, :required, "Last Name"
      param :form, :pga_player_id, :string, :required, "PGA Identification"
      response :not_acceptable
    end

    swagger_api :update do
      summary "Updates an existing Player"
      param :path, :id, :integer, :required, "Player Identification"
      param :form, :first_name, :string, :optional, "First Name"
      param :form, :last_name, :string, :optional, "Last Name"
      param :form, :pga_player_id, :string, :optional, "PGA Identification"
      response :not_found
      response :not_acceptable
    end

    swagger_api :destroy do
      summary "Deletes an existing Player"
      param :path, :id, :integer, :required, "Player Identification"
      response :not_found
      response :not_acceptable
    end

    # ----------------------
    # Actual controller code
    before_action :set_player, only: [:show, :update, :destroy]

    def index
      @players = Player.all
      render json: PlayerSerializer.new(@players).serializable_hash
    end

    def show
      render json: PlayerSerializer.new(@player).serializable_hash
    end

    def create
      @player = Player.new(player_params)
      if @player.save
        render json: @player
      else
        render json: @player.errors, status: :unprocessable_entity
      end
    end

    def update
      if @player.update(player_params)
        render json: @player
      else
        render json: @player.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @player.destroy
      if !@player.destroyed?
        render json: @player.errors, status: :unprocessable_entity
      end
    end

    private

    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.permit(:first_name, :last_name, :pga_player_id)
    end
  end
end
