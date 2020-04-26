class API::V1::CommentsController < ApplicationController

    before_action :set_comment, only: [:update, :destroy]
    before_action :project_comment, only: [:update, :destroy]


    def create
        @project = Project.find(params[:comment][:project_id])  #Project already exists..not building new project so not passing project_id through params.
         if project_user_equals_current_user && @comment = @project.comments.build(comment_params)
          if @comment.save
            render json: CommentSerializer.new(@comment).serialized_json, status: :created
          else
            response = {
                error: @comment.errors_full_messages.to_sentence
            }
            render json: response, status: :unprocessable_entity
          end
        end
    end

    def update
        if project_user_equals_current_user && @comment.update(comment_params)
          render json: CommentSerializer.new(@comment).serialized_json, status: :created
        else
            response = {
              error: @comment.errors_full_messages.to_sentence
          }
          render json: response, status: :unprocessable_entity
       end
    end
  
    def destroy
        if project_user_equals_current_user
          @comment.destroy
          render json: CommentSerializer.new(@comment).serialized_json, status: :created
        else
          render json: {error: 'Cannot destroy'}
        end
    end
  
  
    private
  
    def set_comment
      @comment = Comment.find_by(id: params[:id])
    end
  
    def project_comment
      @project = @comment.project
    end
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  
end
