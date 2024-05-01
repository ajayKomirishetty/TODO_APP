class Todo < ApplicationRecord

  validates :description, length: { maximum: 500 }
  validates :title, presence: true

end
