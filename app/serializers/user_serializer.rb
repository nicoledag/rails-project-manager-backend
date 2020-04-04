class UserSerializer 
    include FastJsonapi::ObjectSerializer
    
    attributes :id, :username, :email, :password_digest
  

    attribute :projects do |user|
      user.projects.map do |project|
        {
          name: project.name,
          department: project.department,
          desc: project.desc,
          client_id: project.client_id,
          target_completion_date: project.target_completion_date,
          completion_date: project.completion_date,
        }
      end
    end

    # has_many :projects, serializer:ProjectSerializer
    # has_many :clients, through: :projects, serializer:ClientSerializer

  end