class CoursesController < ApplicationController
    # Start with swagger docs info
    swagger_controller :courses, "Course Management"
  
    swagger_api :index do
      summary "Fetches all Course objects"
      notes "This lists all the courses"
    end

    swagger_api :show do
      summary "Shows one Course object"
      param :path, :id, :integer, :required, "Course Identification"
      notes "This lists details of one Course"
      response :not_found
    end
  
    swagger_api :create do
      summary "Creates a new Course"
      param :path, :id, :integer, :required, "Course Identification"
      param :form, :pga_course_id, :string, :optional, "PGA Course Identification"
      param :form, :course_code, :string, :optional, "Course Code"
      param :form, :course_name, :string, :optional, "Course Name"
      param :form, :par_in, :integer, :optional, "Par In"
      param :form, :par_out, :integer, :optional, "Par Out"
      param :form, :par_total, :integer, :optional, "Par Total"
      param :form, :distance_in, :integer, :optional, "Distance In"
      param :form, :distance_out, :integer, :optional, "Distance Out"
      param :form, :distance_total, :integer, :optional, "Distance Total"
      response :not_acceptable
    end
  
    swagger_api :update do
      summary "Updates an existing Course"
      param :path, :id, :integer, :required, "Course Identification"
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
      summary "Deletes an existing Course"
      param :path, :id, :integer, :required, "Course identification"
      response :not_found
      response :not_acceptable
    end
  
    # ----------------------
    # Actual controller code
    before_action :set_course, only: [:show, :update, :destroy]
  
    def index
      @courses = Course.all
      render json: @courses #CourseSerializer.new(@courses).serializable_hash
    end

    def show 
      render json: CourseSerializer.new(@course).serializable_hash
    end 

    def create
      @course = Course.new(course_params)
      if @course.save
        render json: @course
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @course.update(course_params)
        render json: @course
      else
        render json: @course.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @course.destroy
      if !@course.destroyed?
        render json: @course.errors, status: :unprocessable_entity
      end
    end
  
    private
      def set_course
        @course = Course.find(params[:id])
      end
  
      def course_params
        params.permit(:pga_course_id, :course_code, :course_name, :par_in, :par_out, :par_total, :distance_in, :distance_out, :distance_total)
      end
  
  end