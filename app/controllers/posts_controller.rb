class PostsController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @posts = Post.all
    end
  
    def new
      @post = current_user.posts.build
    end
  
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to @post, notice: 'Post criado com sucesso.'
      else
        render :new
      end
    end
  
    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
      @comment = @post.comments.build
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post, notice: 'Post atualizado com sucesso.'
      else
        render :edit
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path, notice: 'Post excluído com sucesso.'
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
  