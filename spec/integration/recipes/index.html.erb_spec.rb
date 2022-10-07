require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :feature do
  describe 'asdasd' do 
    before(:all) do
      @user1 = User.create(name: 'Nati', email: 'nati@example.com', password: 'password', confirmed_at: Time.now)
      visit root_path 
      fill_in 'Email', with: 'nati@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      @recipe1 = Recipe.create(name: 'Cooking burger', preparation_time: 1, cooking_time: 1, description: 'good food', public: true, user: @user1)
      
    end
    it "shows list of foods" do
      visit recipes_path
      expect(page).to have_content('Cooking burger')
     end
  end
end



