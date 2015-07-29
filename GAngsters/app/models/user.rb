class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :birthday, presence: true
  has_many :posts
  has_many :comments

end
