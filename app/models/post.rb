class Post < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  belongs_to :admin
  ratyrate_rateable "quality"
  has_attached_file :image, 
  styles: { thumb: "32x32#", small: "64x64#", med: "100x100", large: "200x200#" }, :storage => :s3, :bucket => "foodweb"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates :title, presence: true
  validates :text, presence: true
  has_many :users
end
