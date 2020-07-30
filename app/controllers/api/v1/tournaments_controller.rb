module Api::V1
  class TournamentsController < ApplicationController
    # Start with swagger docs info
    swagger_controller :tournaments, "Tournament Management"

    swagger_api :index do
      summary "Fetches all Tournament objects"
      notes "This lists all the tournaments in PATS system"
    end

    swagger_api :show do
      summary "Shows one Tournament object"
      param :path, :id, :integer, :required, "Tournament Identification"
      notes "This lists details of one Tournament"
      response :not_found
    end

    swagger_api :create do
      summary "Creates a new Tournament"
      param :path, :id, :integer, :required, "Tournament Identification"
      param :form, :tour_code, :string, :optional, "Tour Code"
      param :form, :tour_name, :string, :optional, "Tour Name"
      param :form, :pga_tournament_id, :string, :optional, "PGA Tournament Identification"
      param :form, :tournament_name, :string, :optional, "Tournament Name"
      param :form, :start_date, :datetime, :optional, "Start Date"
      param :form, :end_date, :datetime, :optional, "End Date"
      param :form, :year, :string, :optional, "Year"
      response :not_acceptable
    end

    swagger_api :update do
      summary "Updates an existing Tournament"
      param :path, :id, :integer, :required, "Tournament Identification"
      param :form, :tour_code, :string, :optional, "Tour Code"
      param :form, :tour_name, :string, :optional, "Tour Name"
      param :form, :pga_tournament_id, :string, :optional, "PGA Tournament Identification"
      param :form, :tournament_name, :string, :optional, "Tournament Name"
      param :form, :start_date, :datetime, :optional, "Start Date"
      param :form, :end_date, :datetime, :optional, "End Date"
      param :form, :year, :string, :optional, "Year"
      response :not_found
      response :not_acceptable
    end

    swagger_api :destroy do
      summary "Deletes an existing Tournament"
      param :path, :id, :integer, :required, "Tournament identification"
      response :not_found
      response :not_acceptable
    end

    # ----------------------
    # Actual controller code
    before_action :set_tournament, only: [:show, :update, :destroy]

    def index
      @tournaments = Tournament.all
      render json: @tournaments #TournamentSerializer.new(@tournaments).serializable_hash
    end

    def show
      render json: TournamentSerializer.new(@tournament).serializable_hash
    end

    def create
      @tournament = Tournament.new(tournament_params)
      if @tournament.save
        render json: @tournament
      else
        render json: @tournament.errors, status: :unprocessable_entity
      end
    end

    def update
      if @tournament.update(tournament_params)
        render json: @tournament
      else
        render json: @tournament.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @tournament.destroy
      if !@tournament.destroyed?
        render json: @tournament.errors, status: :unprocessable_entity
      end
    end

    private

    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    def tournament_params
      params.permit(:tour_code, :tour_name, :pga_tournament_id, :tournament_name, :start_date, :end_date, :year)
    end
  end
end
