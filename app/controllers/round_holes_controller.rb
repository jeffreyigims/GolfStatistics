class RoundHolesController < ApplicationController
    # Start with swagger docs info
    '''swagger_controller :players, "Player Management"
  
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
    end'''
  
    # ----------------------
    # Actual controller code
    before_action :set_round_hole, only: [:show, :update, :destroy]
  
    def index
      @round_holes = RoundHole.all
      render json: RoundHoleSerializer.new(@round_holes).serializable_hash
    end

    def show
      render json: RoundHoleSerializer.new(@round_hole).serializable_hash
    end
  
    def create
      @round_hole = RoundHole.new(round_hole_params)
      if @round_hole.save
        render json: @round_hole
      else
        render json: @round_hole.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @round_hole.update(round_hole_params)
        render json: @round_hole
      else
        render json: @round_hole.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @round_hole.destroy
      if !@round_hole.destroyed?
        render json: @round_hole.errors, status: :unprocessable_entity
      end
    end
  
    private
      def set_round_hole
        @round_hole = RoundHole.find(params[:id])
      end
  
      def round_hole_params
        params.permit(:pga_hole_id, :par, :distance, :stimp, :round_id)
      end
  
  end
  