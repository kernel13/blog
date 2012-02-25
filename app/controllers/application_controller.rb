class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter do |controller|
    @menus = Category.where("category_id is null")
    
    if session[:user_id]
       @user = User.find(session[:user_id]) 
    end
      
  end
end
