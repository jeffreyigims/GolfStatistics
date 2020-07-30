module Api::V1
  class PlayerHolesController < ApplicationController
    # Start with swagger docs info
    "" 'swagger_controller :players, "Player Management"
  
    swagger_api :index do
      summary "Fetches all Player objects"
      notes "This lists all the players in PATS system"
    end
  
    swagger_api :create do
      summary "Creates a new Player"
      param :form, :first_name, :string, :required, "First name"
      param :form, :last_name, :string, :required, "Last name"
      param :form, :username, :string, :required, "Username"
      response :not_acceptable
    end
  
    swagger_api :update do
      summary "Updates an existing User"
      param :path, :id, :integer, :required, "User ID"
      param :form, :first_name, :string, :optional, "First name"
      param :form, :last_name, :string, :optional, "Last name"
      param :form, :username, :string, :optional, "Username"
      param :form, :password, :string, :optional, "Password"
      param :form, :password_confirmation, :string, :optional, "Password Confirmation"
      param :form, :role, :string, :optional, "Role [vet|assistant|owner]"
      param :form, :active, :boolean, :optional, "Active"
      response :not_found
      response :not_acceptable
    end
  
    swagger_api :destroy do
      summary "Deletes an existing User"
      param :path, :id, :integer, :required, "User ID"
      response :not_found
      response :not_acceptable
    end' ""

    # ----------------------
    # Actual controller code
    before_action :set_player_hole, only: [:show, :update, :destroy]

    def index
      @player_holes = PlayerHole.all
      render json: @player_holes
    end

    def create
      @player_hole = PlayerHole.new(player_hole_params)
      if @player_hole.save
        render json: @player_hole
      else
        render json: @player_hole.errors, status: :unprocessable_entity
      end
    end

    def update
      if @player_hole.update(player_hole_params)
        render json: @player_hole
      else
        render json: @player_hole.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @player_hole.destroy
      if !@player_hole.destroyed?
        render json: @player_hole.errors, status: :unprocessable_entity
      end
    end

    private

    def set_player_hole
      @player_hole = PlayerHole.find(params[:id])
    end

    def player_hole_params
      params.permit(:hole_num, :cNum, :shots_taken, :par_day, :par_total, :player_id, :round_hole_id)
    end
  end
end
