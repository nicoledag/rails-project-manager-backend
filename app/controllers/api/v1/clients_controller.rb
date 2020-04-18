class API::V1::ClientsController < ApplicationController
    def index
        # binding.pry
        @clients = Client.all 
        clients_json = ClientSerializer.new(@clients).serialized_json
        render json: clients_json
    end
end
