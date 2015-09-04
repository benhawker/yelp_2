require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

	it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
	  Restaurant.create(name: "Moe's Tavern")
	  restaurant = Restaurant.new(name: "Moe's Tavern")
	  expect(restaurant).to have(1).error_on(:name)
	end

	describe 'reviews' do
  	describe 'build_with_user' do

	    let(:user) { User.create email: 'test@test.com' }
	    let(:restaurant) { Restaurant.create name: 'Test' }
	    let(:review_params) { {rating: 5, thoughts: 'yum'} }

	    subject(:review) { restaurant.build_review(review_params, user) }

	    it 'builds a review' do
	      expect(review).to be_a Review
	    end

	    it 'builds a review associated with the specified user' do
	      expect(review.user).to eq user
	    end
  	end
	end

  # let(:user) { User.create(email: "test@test.com", 
  # 												password: "passwordpass", 
  # 												password_confirmation: "passwordpass") }
  
  # let(:user2) { User.create(email: "test2@test.com", 
  # 													password: "passwordpass2", 
  # 													password_confirmation: "passwordpass2") }

  # let(:restaurant) { user.restaurants.create(name: "KFC") }

  # let(:review) { restaurant.reviews.create(thoughts: "Great", 
  # 													rating: "4", 
  # 													user_id: user.id) }


   it "when a restaurant is deleted it's reviews are deleted too" do
   		# restaurant = Restaurant.create(name: "restaurant")
    	# restaurant.reviews.create({"thoughts" => "blah blah", "rating" => 4})
    	# expect { restaurant.destroy }.to change { Review.count }.by(-1)
   end



end
