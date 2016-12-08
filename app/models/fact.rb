class Fact < ApplicationRecord
  resourcify
  acts_as_votable
  has_attached_file :image, :styles => { :large => "1024x768", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default_image.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  #validates :image, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
end
