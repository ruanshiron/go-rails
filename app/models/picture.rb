class Picture < ApplicationRecord
  belongs_to :micropost
  accepts_nested_attributes_for :micropost

  mount_uploader :src, PictureUploader

  validate  :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if src.size > 5.megabytes
      errors.add(:src, "should be less than 5MB")
    end
  end
end
