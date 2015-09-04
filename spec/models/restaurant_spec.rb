require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

	it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
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
