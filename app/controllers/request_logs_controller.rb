class RequestLogsController < ApplicationController
  before_action :set_request_log, only: [:show, :edit, :update, :destroy]

  # GET /request_logs
  # GET /request_logs.json
  def index
    @request_logs = RequestLog.all
  end

  # GET /request_logs/1
  # GET /request_logs/1.json
  def show
  end

  # GET /request_logs/new
  def new
    @request_log = RequestLog.new
  end

  # GET /request_logs/1/edit
  def edit
  end

  # POST /request_logs
  # POST /request_logs.json
  def create
    @request_log = RequestLog.new(request_log_params)

    respond_to do |format|
      if @request_log.save
        format.html { redirect_to @request_log, notice: 'Request log was successfully created.' }
        format.json { render :show, status: :created, location: @request_log }
      else
        format.html { render :new }
        format.json { render json: @request_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_logs/1
  # PATCH/PUT /request_logs/1.json
  def update
    respond_to do |format|
      if @request_log.update(request_log_params)
        format.html { redirect_to @request_log, notice: 'Request log was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_log }
      else
        format.html { render :edit }
        format.json { render json: @request_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_logs/1
  # DELETE /request_logs/1.json
  def destroy
    @request_log.destroy
    respond_to do |format|
      format.html { redirect_to request_logs_url, notice: 'Request log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_log
      @request_log = RequestLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_log_params
      params.require(:request_log).permit(:url)
    end
end
