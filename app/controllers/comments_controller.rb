class CommentsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @post.comments.create(comment_params)
        redirect_to user_post_path(@user, @post)
    end

    def edit
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
    end

    def update
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.update(comment_params)
        redirect_to user_post_path(@user, @post)        
    end

    def destroy
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to user_post_path(@user, @post)
    end

private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
