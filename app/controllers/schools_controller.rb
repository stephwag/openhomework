class SchoolsController < ApplicationController
  def index
    @schools = []

    set_meta_tags site: 'Openhomework', 
        title: 'Find a School', 
        description: "Share course materials and old assignments in any school.",
        keywords: %w[homework school college tuition education course courses study studying tech technology],
        icon: '/favicon.ico'
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
