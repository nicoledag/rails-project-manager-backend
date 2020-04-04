class ProjectSerializer 
    include FastJsonapi::ObjectSerializer
    
    attributes :name, :department, :desc, :client_id, :user_id, :target_completion_date, :completion_date

    attribute :comments do |project|
      project.comments.map do |comment|
        {
          text: comment.text,
          project_id: comment.project_id,
        }
      end
    end


  end