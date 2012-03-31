class AdminController < ApplicationController
  before_filter :authorize
  
  def index
      @posts = Post.all
      @categories = Category.all
  end
end
