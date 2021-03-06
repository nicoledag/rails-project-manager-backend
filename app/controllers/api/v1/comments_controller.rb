class API::V1::CommentsController < ApplicationController

    before_action :set_comment, only: [:update, :destroy]
    before_action :project_comment, only: [:update, :destroy]

    def index
      # binding.pry
      @comments = Comment.all
      comments_json = CommentSerializer.new(@comments).serialized_json
      render json: comments_json
  end


    def create
      # binding.pry
        @project = Project.find(params[:comment][:id])  #Project already exists..not building new project so not passing project_id through params.
         if project_user_equals_current_user && @comment = @project.comments.build(comment_params)
          if @comment.save
            render json: ProjectSerializer.new(@project).serialized_json, status: :created
          else
            response = {
                error: @comment.errors_full_messages.to_sentence
            }
            render json: response, status: :unprocessable_entity
          end
        end
    end

    def update
      # binding.pry
        if project_user_equals_current_user && @comment.update(comment_params)
          render json: ProjectSerializer.new(@project).serialized_json, status: :created
        else
            response = {
              error: @comment.errors_full_messages.to_sentence
          }
          render json: response, status: :unprocessable_entity
       end
    end
  
    def destroy
      # binding.pry
        if @project = Project.find_by(id: params[:project_id])
          @comment.destroy
          render json: ProjectSerializer.new(@project).serialized_json, status: :created
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
      params.require(:comment).permit(:text, :project_id)
    end
  
end
