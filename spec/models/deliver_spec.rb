require 'rails_helper'

RSpec.describe Deliver, type: :model do
  describe "association" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :bill}
  end

  describe "column" do
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    it {is_expected.to have_db_column(:bill_id).of_type(:integer)}
    it {is_expected.to have_db_column(:status).of_type(:integer)}
    it {is_expected.to have_db_index(:bill_id)}
    it {is_expected.to have_db_index(:user_id)}
  end
end
