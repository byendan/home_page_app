class Sheet < ActiveRecord::Base
  belongs_to :user
  has_many :tabs, dependent: :destroy
  validates :name, presence: true
  
end
