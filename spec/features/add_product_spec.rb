require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Create New Product'
    fill_in 'Name', :with => 'Cheese'
    fill_in 'Cost', :with => 2
    fill_in 'Country of origin', :with => 'Usa'
    click_on 'Create Product'
    expect(page).to have_content 'Cheese'
  end
end