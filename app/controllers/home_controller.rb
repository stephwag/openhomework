class HomeController < ApplicationController
  layout 'home'

  def index
    apply_meta_tags
  end
end
