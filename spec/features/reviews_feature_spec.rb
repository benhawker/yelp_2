require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
     visit '/restaurants'
     click_link 'Review KFC'
     fill_in "Thoughts", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Review'

     expect(current_path).to eq '/restaurants'
     expect(page).to have_content('so so')
  end

  # scenario 'user cannot see review link if they have already reviewed the restaurant' do
  #   sign_in_user_1
  #   leave_review
  #   visit '/restaurants'
  #   expect(page).not_to have_content 'Review KFC'
  # end

  # scenario "user can only leave one review per restaurant" do
  # 	sign_in_user_1
  # 	visit restaurants_path
  # 	click_link "Review KFC"
  # 	expect(page).to have_content("You are not eligible to edit this review")
  # end 

  # scenario "users can delete their reviews" do
  # 	user = User.first
  # 	restaurant = restaurant.first
  # 	restaurant.reviews.create(thoughts: "Great food", user: user, rating: 5)
  # 	visit restaurants_path
  # 	click_link "Delete Review"
  # 	expect(page).not_to have_content "Great food"
  # end

  private 

	def sign_in_user_1
		visit ("/")
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
	end

	def sign_out
		visit ("/")
    click_link('Sign out')
	end

	def leave_review(thoughts="Great food", rating='4')
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
 	end

end
