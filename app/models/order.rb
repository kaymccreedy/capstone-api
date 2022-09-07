class Order < ApplicationRecord
  belongs_to :product
  belongs_to :photo
  belongs_to :user

end
