require 'rails_helper'

RSpec.describe 'User pages test index/show ', type: :feature do
  before(:all) do
    @user = User.create(name: 'Solomon', email: 'hello@gmail.com', password: 'password1')
    @food1 = Food.create(name: 'Rspec test 1', measurement_unit: 'kg', price: 3, quantity: 2)
    @food2 = Food.create(name: 'Rspec test 2', measurement_unit: 'kg', price: 3, quantity: 2)
    @food3 = Food.create(name: 'Rspec test 3', measurement_unit: 'kg', price: 3, quantity: 2)
    @food4 = Food.create(name: 'Rspec test 4', measurement_unit: 'kg', price: 3, quantity: 2)
  end

  describe 'User index page test' do
    it 'Should show the username ' do
      visit users_path
      expect(page).to have_content(@user.name)
    end

    it 'Should show the username of all users' do
      visit users_path
      expect(page).to have_content(@user.name)
    end

    it 'Should show button to Add food ' do
      visit foods_path
      expect(page).to have_button('Add food')
    end

    it 'Should show redirects me to that user\'s posts page. ' do
      visit foods_path
      click_button 'Add food'
      expect(page).to have_current_path(new_food_path)
    end
  end
end
