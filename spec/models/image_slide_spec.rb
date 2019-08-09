require 'rails_helper'

RSpec.describe ImageSlide, type: :model do
  describe "association" do
    it {is_expected.to belong_to :product}
  end

  describe "column" do
    it {is_expected.to have_db_column(:product_id).of_type(:integer)}
    it {is_expected.to have_db_column(:image).of_type(:string)}
    it {is_expected.to have_db_column(:note).of_type(:string)}
    it {is_expected.to have_db_index(:product_id)}
  end
end
