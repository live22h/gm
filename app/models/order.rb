class Order < ApplicationRecord
  mount_uploader :picture, OrderUploader

  belongs_to :user
  belongs_to :theme
  has_many :messages
  has_many :specialists

  def isCandidate(user)
    !specialists.where(user_id: user.id).first.nil?
  end

  def isOwner(owner)
      user.id == owner.id
  end
end
