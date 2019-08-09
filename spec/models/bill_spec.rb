require 'rails_helper'

RSpec.describe Bill, type: :model do
  describe "association" do
    it {is_expected.to have_many :order_bills}
    it {is_expected.to have_one :deliver}
    it {is_expected.to belong_to :address}
    it {is_expected.to belong_to :user}
  end

  describe "column" do
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    it {is_expected.to have_db_column(:address_id).of_type(:integer)}
    it {is_expected.to have_db_column(:total_price).of_type(:integer)}
    it {is_expected.to have_db_column(:note).of_type(:string)}
    it {is_expected.to have_db_column(:status).of_type(:integer)}
    it {is_expected.to have_db_index(:address_id)}
    it {is_expected.to have_db_index(:user_id)}
  end
end
