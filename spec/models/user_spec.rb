require 'rails_helper'

RSpec.describe User, type: :model do
  describe "association" do
    it {is_expected.to have_many :addresses}
    it {is_expected.to have_many :bills}
    it {is_expected.to have_many :reply_comments}
    it {is_expected.to have_many :comment_ratings}
    it {is_expected.to have_many :questions}
    it {is_expected.to have_many :reply_questions}
    it {is_expected.to have_many :orders}
    it {is_expected.to have_one :deliver}
  end

  describe "column" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:username).of_type(:string)}
    it {is_expected.to have_db_column(:email).of_type(:string)}
    it {is_expected.to have_db_column(:phone).of_type(:string)}
    it {is_expected.to have_db_column(:gender).of_type(:integer)}
    it {is_expected.to have_db_column(:job).of_type(:string)}
    it {is_expected.to have_db_column(:birthday).of_type(:date)}
    it {is_expected.to have_db_column(:role).of_type(:integer)}
  end
end
