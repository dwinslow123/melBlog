class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]

  # Index action to render all posts
  def index
    @posts = Post.all
  end

  # New action for creating post
  def new
    @post = Post.new
  end

  # Create action to save the post into the database
  def create
    @post = Post.new
    if @post.save(post_params)
      flash[:notice] = "Succesfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating post!"
      render :new
    end
  end

  # Edit action retrieves the post and renders the edit page
  def edit
  end

  # Update action updates the post with new information
  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post!"
    else
      flash[:alert] = "Error updating post!"
    end
  end

  # The show action renders the individual post after retrieving the ID
  def show
  end

  # The destroy action removes the post permanently from the database
  def destroy
    if @post.destroy
      flash[:notice] = "Successfully destroyed post!"
    else
      flash[:alert] = "Error deleting post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
  
end
