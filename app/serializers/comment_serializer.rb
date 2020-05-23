class CommentSerializer 
    include FastJsonapi::ObjectSerializer
    
    attributes :text, :created_at, :project_id

  end