class Order < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  mount_uploader :picture, OrderUploader

end
