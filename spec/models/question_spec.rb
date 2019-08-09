require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "association" do
    it {is_expected.to have_many :reply_questions}
    it {is_expected.to belong_to :product}
    it {is_expected.to belong_to :user}
  end

  describe "column" do
    it {is_expected.to have_db_column(:product_id).of_type(:integer)}
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    it {is_expected.to have_db_column(:content).of_type(:string)}
    it {is_expected.to have_db_column(:image).of_type(:string)}
    it {is_expected.to have_db_index(:product_id)}
    it {is_expected.to have_db_index(:user_id)}
  end
end
