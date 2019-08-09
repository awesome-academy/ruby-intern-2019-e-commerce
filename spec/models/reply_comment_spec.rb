require 'rails_helper'

RSpec.describe ReplyComment, type: :model do
  describe "association" do
    it {is_expected.to belong_to :comment_rating}
    it {is_expected.to belong_to :user}
  end

  describe "column" do
    it {is_expected.to have_db_column(:comment_rating_id).of_type(:integer)}
    it {is_expected.to have_db_column(:user_id).of_type(:integer)}
    it {is_expected.to have_db_column(:content).of_type(:string)}
    it {is_expected.to have_db_column(:image).of_type(:string)}
    it {is_expected.to have_db_index(:comment_rating_id)}
    it {is_expected.to have_db_index(:user_id)}
  end
end
