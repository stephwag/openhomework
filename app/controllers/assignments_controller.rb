class AssignmentsController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    @assignments = @school.assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def create
    @school = School.find(params[:school_id])
    content_type = assignment_params[:filename].content_type
    filetype = Rack::Mime::MIME_TYPES.invert[content_type]
    key = SecureRandom.uuid + filetype

    @assignment = @school.assignments.build(assignment_params)
    @assignment.filename = key
    @assignment.content_type = content_type
    @assignment.original_filename = assignment_params[:filename].original_filename

    respond_to do |format|
      if @assignment.save
        upload_assignment(path: assignment_params[:filename].path, key: key)
        format.html { redirect_to "/schools/#{@school.id}/assignments", notice: "Assignment Uploaded" }
      else
        format.html { redirect_to "/schools/#{@school.id}/assignments", alert: @assignment.errors.full_messages.join(", ") }
      end
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(
      :name, 
      :includes_answers, 
      :course_name, 
      :course_year, 
      :course_semester, 
      :description,
      :content_type,
      :original_filename,
      :filename)
  end
end
