require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    test_product = Product.create(name: "Apple", cost: 3, country_of_origin: "Mexico", id: nil)
    #add user auth. spec here
    # test_product.save
    # id = test_product.id
    visit product_path(test_product)
    click_button 'Add a Review'
    fill_in 'Author', :with => 'Celeste'
    fill_in 'Content body', :with => 'This was the best product I have ever bought, and will buy agian. Thank you!'
    fill_in 'Rating', :with => 4
    click_on 'Create Review'
    expect(page).to have_content 'Celeste'
  end

  # it "gives an error when no name is entered" do
  #   visit new_product_path
  #   click_on 'Create Product'
  #   expect(page).to have_content "Name can't be blank"
  #   expect(page).to have_content "Country of origin can't be blank"
  # end
end