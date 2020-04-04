class Project < ApplicationRecord

    belongs_to :user
    belongs_to :client
    has_many :comments, dependent: :destroy

    validates :name, :department, :client, :target_completion_date, presence: true
end
