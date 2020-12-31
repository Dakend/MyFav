class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  def after_sign_up_path_for(resource)
    user_path resource
  end

  def after_sign_in_path_for(resource)
    user_path resource
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  
  private
    def set_post_form
      @post_form = PostForm.new
    end

    def get_category_and_tag_to_set_header_menu
      @categories_for_menu = Category.joins(:post_categories).uniq
      @tags_for_menu = Tag.order(updated_at: :desc).limit(20).joins(:post_tags).uniq
    end
end
