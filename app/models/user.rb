class User < ApplicationRecord
    has_secure_password

    has_many :projects
    has_many :clients, through: :projects
    
    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true
end
