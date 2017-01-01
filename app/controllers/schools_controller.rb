class SchoolsController < ApplicationController
  def index
    @schools = []
    apply_meta_tags(title: 'Find a School')
  end

  def search
    if params[:search].present? && params[:search][:query].present?
      @schools = School.where("name ILIKE ?", '%' + params[:search][:query] + '%')
    else
      @schools = []
    end

    render action: :index
  end
end
