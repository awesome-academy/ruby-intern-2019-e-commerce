require 'rails_helper'

RSpec.describe ReplyQuestion, type: :model do
  describe "association" do
    it {is_expected.to belong_to :question}
    it {is_expected.to belong_to :user}
  end

  describe "column" do
    it {is_expected.to have_db_column(:question_id).of_type(:integer)}
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    it {is_expected.to have_db_column(:content).of_type(:string)}
    it {is_expected.to have_db_column(:image).of_type(:string)}
    it {is_expected.to have_db_index(:question_id)}
    it {is_expected.to have_db_index(:user_id)}
  end
end
