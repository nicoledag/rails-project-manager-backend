class API::V1::ClientsController < ApplicationController
    def index
        # binding.pry
        @clients = Client.all 
        clients_json = ClientSerializer.new(@clients).serialized_json
        render json: clients_json
    end

    def create
        if current_user.admin
          @client = Client.new(client_params)
          if @client.save
            render json: ClientSerializer.new(@client).serialized_json, status: :created
          else
            response = {
                error: @client.errors_full_messages.to_sentence
            }
            render json: response, status: :unprocessable_entity
          end
        end
      end

      def update
        if current_user.admin && @client.update(client_params)
            render json: ClientSerializer.new(@client).serialized_json, status: :created
        else
            response = {
                error: @client.errors_full_messages.to_sentence
            }
            render json: response, status: :unprocessable_entity
        end
      end

      def destroy
        if current_user.admin
          @client.destroy
          render json: ClientSerializer.new(@client).serialized_json, status: :created
        else
            render json: {error: 'Cannot destroy'}

        end
      end
    
      private

      def set_client
        @client = Client.find_by(id: params[:id])
      end
    
      def client_params
        params.require(:client).permit(:name)
      end
    
    
end
