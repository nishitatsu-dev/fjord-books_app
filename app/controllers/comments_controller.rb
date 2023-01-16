# frozen_string_literal: true

class CommentsController < ApplicationController
  def destroy
    comment = Comment.find(params[:id])
    if current_user_id?(comment.user_id)
      comment.destroy
      redirect_to @commentable, notice: 'Comment was successfully destroyed.'
    else
      redirect_to root_path
    end
  end
end
