class PostController < ApplicationController
  before_action :set_post, only: %i[show @post edit_page update delete]

  # get '/articles'
  def index
    @posts = Post.all
    # render json: @post, each_serializer: PostsSerializer, status: :ok
  end

  # get '/articles/:id'
  def show
    @post
  end

  def create_page
    @post
  end

  def edit_page
    @post
  end

  # post '/create-article'
  def create
    @post = Post.new(permitted_parameters)
    if @post.save
      redirect_to action: 'index'
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # put '/edit-article/:id'
  def update
    if @post.update(permitted_parameters)
      redirect_to action: 'index'
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # delete '/articles/:id'
  def delete
    if @post.destroy
      redirect_to action: 'index'
    else
      head :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def permitted_parameters
    params.permit(:title, :body)
  end

end
