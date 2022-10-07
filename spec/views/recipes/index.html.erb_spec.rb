require 'rails_helper'
Capybara.current_driver = :rack_test 

RSpec.describe 'recipes/index.html.erb', type: :feature do
  describe 'asdasd' do
    before(:each) do
      @user1 = User.create(name: 'Nati', email: 'nati@example.com', password: 'password')
      login_as(@user1, :scope => :user)
      # visit root_path
      # fill_in 'Email', with: 'nati@example.com'
      # fill_in 'Password', with: 'password'
      # click_button 'Log in'
      @recipe1 = Recipe.create(name: 'Cooking burger', preparation_time: 1, cooking_time: 1, description: 'good food', public: true)
      visit recipes_path
    end
    it "shows list of foods" do
      expect(page).to have_content('Cooking burger')
     end
  end
end



