module Api::V1
  class Customers::CommentsController < Customers::BaseController
    before_action :set_request

    # POST v1/customer/requests/:request_id/comments
    def create
      @comment = @request.request_comments.new comment_params
      @comment.author = current_customer

      if @comment.save
        render json: @comment, status: :created
      else
        render json: { errors: @comment.errors } , status: :unprocessable_entity
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find params[:request_id]
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:request_comment).permit(:text)
    end
  end
end