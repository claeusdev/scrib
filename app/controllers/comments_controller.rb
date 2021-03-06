class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@comment = @commentable.comments.new(comment_params)
		@comment.user = current_user
		respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Your comment was added.' }
        format.json { render :show, status: :created, location: @commentable }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
	end


	private	

	def comment_params
		params.require(:comment).permit(:body)
	end
end