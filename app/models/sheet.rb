class Sheet < ActiveRecord::Base
  belongs_to :user
  has_many :tabs, dependent: :destory
  validates :name, presence: true
  
end
