class Micropost < ApplicationRecord
  belongs_to :user

  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :content, presence: true

  include PgSearch
  pg_search_scope :search_by_full_name, against: [:title, :content],
    using: {
      tsearch: {
        prefix: true,
        negation: true,
        highlight: {
          start_sel: '<b>',
          stop_sel: '',
        }
      }
    }
end