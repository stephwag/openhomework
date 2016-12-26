class Assignment < ActiveRecord::Base
  belongs_to :school
  validates :name, presence: true
  validates :course_name, presence: true
  validates :course_year, presence: true
  validates :course_semester, presence: true
  validates :filename, presence: true

  def download_url
    filetype = Rack::Mime::MIME_TYPES.invert[content_type]
    "https://" + ENV['AWS_CLOUDFRONT_HOST'] + "/assignments/#{filename}#{filetype}"
  end

  def display_includes_answers?
    if includes_answers?
      'Yes'
    else
      'No'
    end
  end
end
