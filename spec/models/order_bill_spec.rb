require 'rails_helper'

RSpec.describe OrderBill, type: :model do
  describe "association" do
    it {is_expected.to belong_to :bill}
    it {is_expected.to belong_to :order}
  end

  describe "column" do
    it {is_expected.to have_db_column(:bill_id).of_type(:integer)}
    it {is_expected.to have_db_column(:order_id).of_type(:integer)}
    it {is_expected.to have_db_index(:bill_id)}
    it {is_expected.to have_db_index(:order_id)}
  end
end
