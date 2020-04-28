class ProjectSerializer 
    include FastJsonapi::ObjectSerializer
    
    attributes :name, :department, :desc, :budget, :end_destination, :quantity, :client_id, :user_id, :target_completion_date, :completion_date, :created_at, :updated_at
    attribute :comments do |project|
      project.comments.map do |comment|
        {
          text: comment.text,
          created_at: comment.created_at,
          updated_at: comment.updated_at,
          comment_id: comment.id,
        }
      end
    end
    
    belongs_to :client

  end