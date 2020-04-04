class ClientSerializer 
    include FastJsonapi::ObjectSerializer
    
    attributes :name

    # has_many :projects, dependent: :destroy, serializer:ProjectSerializer
    # has_many :users, through: :projects, serializer:UserSerializer

  end