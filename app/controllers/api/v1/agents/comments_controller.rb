module Api::V1
  class Agents::CommentsController < Agents::BaseController
    before_action :set_request

    # POST v1/agent/requests/:request_id/comments
    def create
      @comment = Comment.build comment_params
      @comment.author = current_agent

      if @comment.save
        render json: @comment, status: :created, location: @request
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find params[:request_id]
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end