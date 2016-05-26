class Restaurant < ActiveRecord::Base
	has_many :reviews
	belongs_to :user
	validates :name, length: { minimum: 3 }, uniqueness: true

	has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
	
	def average_rating
    return "N/A" if reviews.none?
    sum = 0
    i = 0
    reviews.each do |review|
      sum += review.rating
      i+=1
    end
    return sum/i.to_f
  end

	#def average_rating
	#  reviews = self.reviews
	#  review_sum = reviews.inject(0) { |sum, review| sum += review.rating }
	#  avg_rating = (review_sum / reviews.count).to_i unless review_sum == 0
	#end
end
