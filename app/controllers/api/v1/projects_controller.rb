class API::V1::ProjectsController < ApplicationController

    def index
        binding.pry
        @projects = current_user.projects
        projects_json = ProjectSerializer.new(@projects).serialized_json
        render json: projects_json
    end

end
