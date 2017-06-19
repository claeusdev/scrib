class Post < ApplicationRecord
	has_attached_file :photo, styles: { medium: "300x300>", thumb: "80x80>" }, default_url: "/images/:style/missing.svg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  belongs_to :user

  default_scope { order("created_at DESC") }

  validates :title, :content, presence: true
end
