class SubTask < ApplicationRecord
  belongs_to :task
  
  validates :content, presence: true, length: { maximum: 50 }
end
