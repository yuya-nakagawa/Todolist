class Task < ApplicationRecord
  belongs_to :user
  
  has_many :sub_tasks, :dependent => :destroy
  
  validates :content, presence: true, length: { maximum: 50 }
  
  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"]) #検索とcontentの部分一致を表示。
    else
      all
    end
  end
end
