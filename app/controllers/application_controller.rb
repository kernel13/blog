class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter do |controller|
    
    #Get all the top categories to build the main application menu
    @menus = Category.where("category_id is null")
    
    #Retrive the current authenticated user
    if session[:user_id]
       @user = User.find(session[:user_id]) 
    end
    
    #Get the current selected menu
    @menu = @menus.first
    if params[:category_id]
      #if the given category id is a sub category then we keep the current menu which contains the main selected menu
      if Category.find(params[:category_id]).parent
          @menu = Category.find(session[:menu_id])
      else
          @menu = Category.find(params[:category_id])
      end
      
      session[:menu_id] = @menu.id
    end
      
  end
  
  private
  
  # Use to check if the user is authenticated
  def authorize
      unless @user
          redirect_to login_url, :notice => "Unauthorize access"
      end
  end
  
end
