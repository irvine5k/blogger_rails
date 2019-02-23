class CommentsController < ApplicationController
    before_filter :require_login, except: [:create]
    
    def create
        @comment = Comment.new(comment_params)
        @comment.article_id = params[:article_id]
        if @comment.save
          flash[:success] = "Object successfully created"
          redirect_to article_path(@comment.article)
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    private 

    def comment_params 
        params.require(:comment).permit(:author, :body)
    end
    
end
