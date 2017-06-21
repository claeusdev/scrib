class Post < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged

	has_attached_file :photo, styles: { large: "600x400>",medium: "300x300>", thumb: "80x80>" }, default_url: "/images/:style/missing.svg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  
  default_scope { order("created_at DESC") }
  belongs_to :user
  has_many :comments
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  has_many :comments, as: :commentable

  validates :title, :content, presence: true
  validates :slug, uniqueness: true, presence: true

  def self.tagged_with(name)
    Tag.find_by(name: name).posts  
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(',')
  end
  
end
