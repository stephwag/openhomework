class AssignmentsController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    @assignments = @school.assignments
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def download
    @assignment = Assignment.find(params[:id])

    @charge = Stripe::Charge.create(
      card: params[:stripeToken],
      amount: 200,
      currency: 'usd',
      description: "Assignment download from Openhomework")

    @download = Download.create(
      stripe_token: params[:stripeToken], 
      stripe_email: params[:stripeEmail], 
      assignment_id: @assignment.id)
  end

  def create
    @school = School.find(params[:school_id])
    key = SecureRandom.uuid

    @assignment = @school.assignments.build(assignment_params)

    respond_to do |format|
      if @assignment.valid?

        s3 = Aws::S3::Resource.new(region:'us-west-2')
        obj = s3.bucket(ENV['AWS_S3_BUCKET']).object("assignments/#{key}")
        obj.upload_file(assignment_params[:filename].path)

        @assignment.filename = key
        @assignment.content_type = assignment_params[:filename].content_type
        @assignment.original_filename = assignment_params[:filename].original_filename
        @assignment.save

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
