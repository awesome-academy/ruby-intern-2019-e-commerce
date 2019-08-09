require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "association" do
    it {is_expected.to belong_to :user}
    it {is_expected.to have_one :bill}
  end

  describe "column" do
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:phone).of_type(:string)}
    it {is_expected.to have_db_column(:address_receive).of_type(:string)}
    it {is_expected.to have_db_column(:province).of_type(:string)}
    it {is_expected.to have_db_column(:district).of_type(:string)}
    it {is_expected.to have_db_column(:ward).of_type(:string)}
    it {is_expected.to have_db_column(:default).of_type(:boolean)}
    it {is_expected.to have_db_index(:user_id)}
  end
end
