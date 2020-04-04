class UserSerializer 
    include FastJsonapi::ObjectSerializer
    
    attributes :id, :username, :email, :password_digest
  
    # has_many :projects, serializer:BusinessSerializer
    # has_many :clients, through: :projects, serializer:ClientSerializer

  end