class User < ActiveRecord::Base   
    has_secure_password

    validates :name, presence: true   
    validates :username, presence: true, uniqueness: true
    validates :password, length: {in: 6..20}, unless: ->(user){user.password.blank?}
    
    has_many :friends
end