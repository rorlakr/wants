class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @commentable = params.keys.last.split('_')[0].capitalize.constantize.find params.values.last.to_i
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    respond_to do | format |
      format.js
    end
  end

  def destroy
    @commentable = params.keys[-2].split('_')[0].capitalize.constantize.find params.values[-2].to_i
    @comment = @commentable.comments.find params[:id]
    @comment.destroy
    respond_to do | format |
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
