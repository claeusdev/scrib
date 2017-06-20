class Post < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged

	has_attached_file :photo, styles: { medium: "300x300>", thumb: "80x80>" }, default_url: "/images/:style/missing.svg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  

  belongs_to :user

  default_scope { order("created_at DESC") }

  has_many :comments
  accepts_nested_attributes_for :comments

  validates :title, :content, presence: true
  validates :slug, uniqueness: true, presence: true

  
end
