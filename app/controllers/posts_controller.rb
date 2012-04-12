class PostsController < ApplicationController
  before_filter :authorize, :only => [:new, :edit, :create, :update, :destroy]
  
  # GET /posts
  # GET /posts.json
  def index
    
    begin
      
      params[:page] = params[:page] || 1
      
      if params[:category_id] 
          cat_id =  params[:category_id]
      else
          cat_id = Category.select("id").where("name = 'Home'")
      end
      
      if @user
        @posts = Post.order("created_at DESC")
                      .where("category_id = ? and published = ?", cat_id, true)
                      .paginate(:page => params[:page])
  
      else
        if Category.find(cat_id).authenticated 
          redirect_to login_url
        else
      
          @posts = Post.order("created_at DESC")
                    .where("category_id = ? and published = ?", cat_id, true)
                    .paginate(:page => params[:page])
        end
      end
    
      @latest_posts = Post.order("created_at DESC").limit(2)    
      @category = Category.find(cat_id)
    
    rescue ActiveRecord::RecordNotFound
          logger.error "One of the record you were looking for as not be found in the database"
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @categories = Category.all.map{|category| [category.name, category.id] }
    @category = Category.find(params[:category_id])
    @post.category = @category
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all.map{|category| [category.name, category.id] }
    
    if params[:category_id]
      @category = Category.find(params[:category_id])
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
