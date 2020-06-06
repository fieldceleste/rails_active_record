require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    user = User.create!(:email => 'celeste@aol.com', :password => 'hello1234567', :admin => 'true')
    login_as(user, :scope => :user)
    test_product = Product.create(name: "Apple", cost: 3, country_of_origin: "Mexico", id: nil)
    visit product_path(test_product)
    click_button 'Add a Review'
    fill_in 'Author', :with => 'Celeste'
    fill_in 'Content body', :with => 'This was the best product I have ever bought, and will buy agian. Thank you!'
    fill_in 'Rating', :with => 4
    click_on 'Create Review'
    expect(page).to have_content 'Celeste'
  end

  it "gives an error when field is left blank" do
    user = User.create!(:email => 'celeste@aol.com', :password => 'hello1234567', :admin => 'true')
    login_as(user, :scope => :user)
    test_product = Product.create(name: "Apple", cost: 3, country_of_origin: "Mexico", id: nil)
    visit product_path(test_product)
    click_button 'Add a Review'
    click_button 'Create Review'
    expect(page).to have_content "Author can't be blank"
    expect(page).to have_content "Content body can't be blank"
    expect(page).to have_content "Content body is too short (minimum is 50 characters)"
    expect(page).to have_content "Rating can't be blank"
    expect(page).to have_content "Rating is not a number"
  end
end