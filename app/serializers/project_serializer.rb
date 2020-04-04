class ProjectSerializer 
    include FastJsonapi::ObjectSerializer
    
    attributes :name, :department, :desc, :client_id, :user_id, :target_completion_date, :completion_date

    # belongs_to :user, serializer:UserSerializer
    # belongs_to :client, serializer:ClientSerializer
    # has_many :comments, dependent: :destroy, serializer:CommentSerializer


  end