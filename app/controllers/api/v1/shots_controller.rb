module Api::V1
  class ShotsController < ApplicationController
    # Start with swagger docs info
    swagger_controller :courses, "Shot Management"

    swagger_api :index do
      summary "Fetches all Shot objects"
      notes "This lists all the shots"
    end

    swagger_api :show do
      summary "Shows one Shot object"
      param :path, :id, :integer, :required, "Shot Identification"
      notes "This lists details of one Shot"
      response :not_found
    end

    swagger_api :create do
      summary "Creates a new Shot"
      param :path, :id, :integer, :required, "Shot Identification"
      param :form, :shot_num, :string, :optional, "Shot Number"
      param :form, :time, :datetime, :optional, "Time"
      param :form, :t, :string, :optional, "t"
      param :form, :prv, :string, :optional, "prv"
      param :form, :tee, :string, :optional, "Tee Shot"
      param :form, :cup, :string, :optional, "Cup"
      param :form, :from, :string, :optional, "From"
      param :form, :to, :string, :optional, "To"
      param :form, :asc, :string, :optional, "ASC"
      param :form, :dist, :integer, :optional, "Distance Shot"
      param :form, :left, :integer, :optional, "Distance Left"
      param :form, :x, :integer, :optional, "X-Coordinate"
      param :form, :y, :integer, :optional, "Y-Coordinate"
      param :form, :z, :integer, :optional, "Z-Coordinate"
      param :form, :club, :string, :optional, "Club"
      param :form, :con, :string, :optional, "Con"
      param :form, :shot_text, :string, :optional, "Description"
      param :form, :round_hole_id, :integer, :optional, "Round Hole Identification"
      response :not_acceptable
    end

    swagger_api :update do
      summary "Updates an existing Shot"
      param :path, :id, :integer, :required, "Shot Identification"
      param :form, :pga_course_id, :string, :optional, "PGA Course Identification"
      param :form, :course_code, :string, :optional, "Course Code"
      param :form, :course_name, :string, :optional, "Course Name"
      param :form, :par_in, :integer, :optional, "Par In"
      param :form, :par_out, :integer, :optional, "Par Out"
      param :form, :par_total, :integer, :optional, "Par Total"
      param :form, :distance_in, :integer, :optional, "Distance In"
      param :form, :distance_out, :integer, :optional, "Distance Out"
      param :form, :distance_total, :integer, :optional, "Distance Total"
      response :not_found
      response :not_acceptable
    end

    swagger_api :destroy do
      summary "Deletes an existing Shot"
      param :path, :id, :integer, :required, "Shot identification"
      response :not_found
      response :not_acceptable
    end

    # ----------------------
    # Actual controller code
    # before_action :set_shot, only: [:show, :update, :destroy]

    def index
      @shots = Shot.all
      render json: @shots # ShotSerializer.new(@shots).serializable_hash
    end

    def create
      @shot = Shot.new(shot_params)
      if @shot.save
        render json: @shot
      else
        render json: @shot.errors, status: :unprocessable_entity
      end
    end

    private

    def set_shot
      @shot = Shot.find(params[:id])
    end

    def shot_params
      params.permit(:shot_num, :time, :t, :prv, :tee, :cup, :from, :to, :asc, :dist, :left, :x, :y, :z, :club, :con, :shot_text, :player_hole_id)
    end
  end
end
