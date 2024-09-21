class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
          has_many :comments, dependent: :destroy 
          has_many :posts, dependent: :destroy
          has_many :chats, dependent: :destroy   
          has_many :groups, dependent: :destroy 
          
  def active_for_authentication?
    super && (is_deleted == true)
  end
end
