class CommentsController < ApplicationController # :nodoc:
  before_action :set_issue

  def create
    @comment = @issue.comments.build
    @comment.body = params[:comment][:body]
    if @comment.save
      redirect_to @issue
    else
      render 'new'
    end
  end

  private

  def set_issue
    @issue = Issue.find(params[:issue_id])
  end

  def comment_params
    params.required(:comment).permit(:body)
  end
end
