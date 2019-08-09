require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "association" do
    it {is_expected.to have_many :image_slides}
    it {is_expected.to have_many :comment_ratings}
    it {is_expected.to have_many :questions}
    it {is_expected.to have_many :orders}
  end

  describe "column" do
    it {is_expected.to have_db_column(:category_id).of_type(:integer)}
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:price).of_type(:integer)}
    it {is_expected.to have_db_column(:thumbnail).of_type(:string)}
    it {is_expected.to have_db_column(:description).of_type(:string)}
    it {is_expected.to have_db_column(:number_items).of_type(:integer)}
    it {is_expected.to have_db_column(:count_view).of_type(:integer)}
    it {is_expected.to have_db_index(:category_id)}
  end
end
