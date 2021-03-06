class Tab < ActiveRecord::Base
  belongs_to :sheet
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :sheet_id, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validate :picture_size
  
  private
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
end
