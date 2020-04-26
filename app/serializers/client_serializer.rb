class ClientSerializer 
    include FastJsonapi::ObjectSerializer
    
    attributes :name, :created_at


    attribute :projects do |client|
      client.projects.map do |project|
        {
          name: project.name,
          department: project.department,
          desc: project.desc,
          user_id: project.user_id,
          budget: project.budget,
          quantity: project.quantity,
          end_destination: project.end_destination,
          target_completion_date: project.target_completion_date,
          completion_date: project.completion_date,
        }
      end
    end
    # has_many :projects, dependent: :destroy, serializer:ProjectSerializer
    # has_many :users, through: :projects, serializer:UserSerializer

  end