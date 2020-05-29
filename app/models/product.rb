class Product < ApplicationRecord
  
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(5)
    )}

  scope :locally_made, -> { where(country_of_origin: "Usa") }
  
  
  
  has_many :reviews,  dependent: :destroy
  validates :name, presence: true
  validates :country_of_origin, presence: true
  validates_length_of :country_of_origin, maximum: 50
  validates_length_of :name, maximum: 50
  before_save(:titleize_product)
  

  private
    def titleize_product
      self.name = self.name.titleize
      self.country_of_origin = self.country_of_origin.titleize
    end
end