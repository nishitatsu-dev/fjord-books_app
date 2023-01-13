# frozen_string_literal: true

class CommentsController < ApplicationController
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to @commentable, notice: 'Comment was successfully destroyed.'
  end
end
