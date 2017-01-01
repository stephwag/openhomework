class Assignment < ActiveRecord::Base
  belongs_to :school
  validates :name, presence: true
  validates :course_name, presence: true
  validates :course_year, presence: true
  validates :course_semester, presence: true
  validates :filename, presence: true

  def download_url
    "https://" + ENV['AWS_CDN_HOST'] + "/assignments/#{filename}"
  end

  def display_includes_answers?
    if includes_answers?
      'Yes'
    else
      'No'
    end
  end
end
