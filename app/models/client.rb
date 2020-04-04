class Client < ApplicationRecord
   
    has_many :projects, dependent: :destroy
    has_many :users, through: :projects
  
    validates :name, presence: true
    validates_uniqueness_of :name, :case_sensitive => false
    # validates :zip, length: { minimum: 5 }
    
end
