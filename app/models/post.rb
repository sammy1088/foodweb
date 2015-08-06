class Post < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  belongs_to :user

  has_attached_file :image, 
  styles: { small: "64x64#", med: "100x100", large: "200x200#" },

    :storage => :s3,
  :bucket => 'foodweb',
 :s3_credentials => S3_CREDENTIALS


              
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
