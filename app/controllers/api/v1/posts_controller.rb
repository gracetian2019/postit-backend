class Api::V1::PostsController < ApplicationController

    def index
       @posts = Post.all
      
      render json: @posts.last(15).reverse()
      end
    
      def show
        @post = Post.find(params[:id])

        render json: @post
      end

      def create 
        
        @post = Post.create({
          title: params[:title],
          content: params[:content],   
          user_id: params[:user_id],
          likes: params[:likes]
        })
         
        render json: @post
      end

      def likes
        @post = Post.find(params[:id])
    
        @post.update(likes: @post.likes + 1)
    
        render json: @post
      end 

      def unlikes
        
          @post = Post.find(params[:id])
      
          @post.update(likes: post.likes - 1)
      
          render json: @post
       
      end

      def comment
        post = Post.find(params[:id])
        
        comment = Comment.create({
          content: params[:content],
          likes: 0,
          post: post,
          user_id: params[:user_id]
        })
    
        render json: comment
      end

      private

      def post_params
         #  params.require(:post).permit(:title, :content, :created_at, :likes, :comments, :id)
         params.require(:post).permit(:title, :content, :user_id, :likes)
      end
end
