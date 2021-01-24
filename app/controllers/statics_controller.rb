class StaticsController < ApplicationController
  before_action :set_post_form, only: [:about]
  before_action :get_category_and_tag_to_set_header_menu, only: [:about]

  def about
  end
end