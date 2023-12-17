class Architecture < ApplicationRecord
  belongs_to :category
  has_one :address, dependent: :destroy
end
