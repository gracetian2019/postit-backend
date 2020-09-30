class User < ApplicationRecord
    has_secure_password

     has_many :comments
     has_many :posts, through: :comments
     validates :username, uniqueness: true, case_sensitive: false
end
