class TimesheetsController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate
  before_action :set_timesheet, only: [:show, :update, :destroy]

  # GET /timesheets
  def index
    @timesheets = @current_employee.timesheets.all

    render json: @timesheets
  end

  # GET /timesheets/1
  def show
    if @timesheet
      render json: @timesheet
    else
      render_not_found
    end
  end

  # POST /timesheets
  def create
    @timesheet = @current_employee.timesheets.new(timesheet_params)

    if @timesheet.save
      render json: @timesheet, status: :created, location: @timesheet
    else
      render json: @timesheet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /timesheets/1
  def update
    if @timesheet
      if @timesheet.update(timesheet_params)
        render json: @timesheet
      else
        render json: @timesheet.errors, status: :unprocessable_entity
      end
    else
      render_not_found
    end

  end

  # DELETE /timesheets/1
  def destroy
    if @timesheet
      @timesheet.destroy
    else
      render_not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timesheet
      begin
        @timesheet = @current_employee.timesheets.find(params[:id])
      rescue StandardError => ex
        @timesheet = nil
      end
    end

    # Only allow a list of trusted parameters through.
    def timesheet_params
      params.require(:timesheet).permit(:employee_id, :company, :date, :start_time, :end_time)
    end

    def authenticate
      authenticate_token || render_unauthorized
    end

    def authenticate_token
      authenticate_with_http_token do |token, options|
        @current_employee = Employee.find_by(api_key: token)
      end
    end

    def render_unauthorized(realm = "Application")
      self.headers["WWW-Authenticate"] = %(Token realm="#{realm}")
      render json: 'Bad credentials', status: :unauthorized
    end

    def render_not_found(realm = "Application")
      render json: 'Not found', status: :not_found
    end
end
