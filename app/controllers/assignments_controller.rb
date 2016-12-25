class AssignmentsController < ApplicationController
  def index
    @course = School.find(params[:school_id])
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def download
    @assignment = Assignment.find(params[:id])
  end

  def create
  end

  private

  def assignment_params
    params.require(:assignment).permit(:name, :filename)
  end
end
