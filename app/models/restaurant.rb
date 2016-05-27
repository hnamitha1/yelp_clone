class Restaurant < ActiveRecord::Base
	has_many :reviews
	belongs_to :user
	validates :name, length: { minimum: 3 }, uniqueness: true

	has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
 
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/    
	
	def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end

	#def average_rating
	#  reviews = self.reviews
	#  review_sum = reviews.inject(0) { |sum, review| sum += review.rating }
	#  avg_rating = (review_sum / reviews.count).to_i unless review_sum == 0
	#end
end
