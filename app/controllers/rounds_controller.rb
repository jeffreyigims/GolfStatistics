class RoundsController < ApplicationController
    # Start with swagger docs info
    swagger_controller :rounds, "Round Management"
  
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
    end
  
    # ----------------------
    # Actual controller code
    before_action :set_round, only: [:show, :update, :destroy]
  
    def index
      @rounds = Round.all
      render json: @rounds #RoundSerializer.new(@rounds).serializable_hash
    end

    def show 
      render json: RoundSerializer.new(@rounds).serializable_hash
    end 
  
    def create
      @round = Round.new(round_params)
      if @round.save
        render json: @round
      else
        render json: @round.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @round.update(round_params)
        render json: @round
      else
        render json: @round.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @round.destroy
      if !@round.destroyed?
        render json: @round.errors, status: :unprocessable_entity
      end
    end
  
    private
      def set_round
        @round = Round.find(params[:id])
      end
  
      def round_params
        params.permit(:round_num, :tournament_id, :course_id)
      end
  
  end
  