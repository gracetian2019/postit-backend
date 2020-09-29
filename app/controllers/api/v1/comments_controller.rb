class Api::V1::CommentsController < ApplicationController
    def index
        @comments = Comment.all
  
       render json: Comment.all
       end

       def destroy
        @comment = Comment.find(params[:id])
        @comment.delete

        render json: {commentId: @comment.id}
       end

       private

       def comment_params
           params.require(:comment).permit(:id)
       end
end
