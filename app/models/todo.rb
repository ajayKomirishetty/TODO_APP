class Todo < ApplicationRecord

  validates :description, length: { maximum: 500 }
end
