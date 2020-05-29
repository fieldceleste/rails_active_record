require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :country_of_origin }
  it { should validate_length_of(:country_of_origin).is_at_most(50) }
  it { should validate_length_of(:name).is_at_most(50) }
  
  it("titleizes the name of an product, and country of origin") do
    product = Product.create({name: "apple pie", cost: 1, country_of_origin: "usa"})
    expect(product.name()).to(eq("Apple Pie"))
    expect(product.country_of_origin()).to(eq("Usa"))
  end
end