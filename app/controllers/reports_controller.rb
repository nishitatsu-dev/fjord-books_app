# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  # GET /reports or /reports.json
  def index
    @reports = Report.eager_load(:user).order('reports.id DESC').page(params[:page])
  end

  # GET /reports/1 or /reports/1.json
  def show; end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
    redirect_to root_path unless current_user_id?(@report.user_id)
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)

    if @report.save
      redirect_to reports_url, notice: 'Report was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    redirect_to root_path and return unless current_user_id?(@report.user_id)

    if @report.update(report_params)
      redirect_to reports_url, notice: 'Report was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    if current_user_id?(@report.user_id)
      @report.destroy
      redirect_to reports_url, notice: 'Report was successfully destroyed.'
    else
      redirect_to root_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.require(:report).permit(:user_id, :title, :body)
  end
end
