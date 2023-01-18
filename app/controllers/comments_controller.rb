# frozen_string_literal: true

class CommentsController < ApplicationController
  def destroy
    comment = Comment.find(params[:id])
    return redirect_to root_path unless current_user.id == comment.user_id

    comment.destroy
    redirect_to @commentable, notice: 'Comment was successfully destroyed.'
  end
end
