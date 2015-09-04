class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy

	# has_many :reviews do
	#   def build_with_user(attributes = {}, user)
	#     attributes[:user] ||= user
	#     build(attributes)
	#   end
	# end

	def build_review(review_params, user)
    self.reviews.new(thoughts: review_params["thoughts"], rating: review_params["rating"], user: user)
  end

	validates :name, length: {minimum: 3}, uniqueness: true

end
