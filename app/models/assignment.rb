class Assignment < ActiveRecord::Base
  def download_url
    "https://" + ENV['AWS_CLOUDFRONT_HOST'] + "/assignments/#{filename}"
  end

  def display_includes_answers?
    includes_answers == 0 ? 'Yes' : 'No'
  end
end
