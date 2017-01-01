class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def apply_meta_tags(title: "Be Resourceful", description: "Share course materials and old assignments in any school.")
    set_meta_tags site: 'Openhomework', 
    title: title, 
    description: description,
    keywords: %w[homework school college tuition education course courses study studying tech technology],
    icon: '/favicon.ico'
  end

  def upload_assignment(path:,key:)
    s3 = Aws::S3::Resource.new(region:'us-west-2')
    obj = s3.bucket(ENV['AWS_S3_BUCKET']).object("assignments/#{key}")
    obj.upload_file(assignment_params[:filename].path)
  end
end
