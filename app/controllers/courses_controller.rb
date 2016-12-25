class CoursesController < ApplicationController
  def index
    @school = School.find(params[:school_id])
  end
end
