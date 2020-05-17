class API::V1::ProjectsController < ApplicationController

    before_action :set_project, only: [:update, :destroy]
    def index
        # binding.pry
        @projects = current_user.projects
        projects_json = ProjectSerializer.new(@projects).serialized_json
        render json: projects_json
    end

    def create
        # binding.pry
        @project = current_user.projects.build(project_params)
          if @project.save
            render json: ProjectSerializer.new(@project).serialized_json, status: :created
          else
            response = {
                error: @project.errors_full_messages.to_sentence
            }
            render json: response, status: :unprocessable_entity
          end
      end
    
      def update
        # binding.pry
        if project_user_equals_current_user && @project.update(project_params)
            render json: ProjectSerializer.new(@project).serialized_json, status: :created
        else
            response = {
                error: @project.errors_full_messages.to_sentence
            }
            render json: response, status: :unprocessable_entity
        end
      end
    
      def destroy
        # binding.pry
        # raise params.inspect
        if project_user_equals_current_user
          @project.destroy
          render json: ProjectSerializer.new(@project).serialized_json, status: :created
        else
            render json: {error: 'Cannot destroy'}
        end
      end
    
      private
    
      def set_project
        @project = Project.find_by(id: params[:id])
      end
    
    
      def project_params
        params.require(:project).permit(:name, :desc, :budget, :quantity, :end_destination, :target_completion_date, :completion_date, :client_id)
      end



end
