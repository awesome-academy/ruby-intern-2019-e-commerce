require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "association" do
    it {is_expected.to have_one :order_bill}
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :product}
    it {is_expected.to have_one :order_bill}
  end

  describe "column" do
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    it {is_expected.to have_db_column(:product_id).of_type(:integer)}
    it {is_expected.to have_db_column(:count).of_type(:integer)}
    it {is_expected.to have_db_column(:price_per_item).of_type(:integer)}
    it {is_expected.to have_db_column(:status).of_type(:integer)}
    it {is_expected.to have_db_index(:product_id)}
    it {is_expected.to have_db_index(:user_id)}
  end
end
