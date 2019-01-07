class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  mount_uploader :avatar, AvatarUploader
  has_many :orders, dependent: :destroy
  has_many :messages
  has_many :specialists
  
end
