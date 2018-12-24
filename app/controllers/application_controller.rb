class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #どの機能を使うにしてもまずはログインしなければいけない
  before_action :authenticate_user!, :except=>[:show]

    protected

  def devise_parameter_sanitizer
  	if resource_class == User
  		User::ParameterSanitizer.new(User, :user, params)
  	else
  		super # Use the default one
    end
  end
end
