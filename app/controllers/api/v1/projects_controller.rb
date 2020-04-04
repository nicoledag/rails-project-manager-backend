class API::V1::ProjectsController < ApplicationController

    def index
        @projects = Project.all 
        projects_json = ProjectSerializer.new(@projects).serialized_json
        render json: projects_json
    end

end
