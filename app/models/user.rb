class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  PARAMS_SIGN_UP = %i(username name email phone password password_confirmation).freeze
  PARAMS_USER_UPDATE = %i(username name email phone gender birthday password
      password_confirmation last_cart).freeze
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i



  has_many :addresses, dependent: :destroy
  has_many :bills
  has_many :reply_comments, dependent: :destroy
  has_many :comment_ratings, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :reply_questions, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :delivers

  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  validates :username, uniqueness: true, presence: true,
            length: {maximum: Settings.user_valid.max_length_username}
  validates :name, presence: true,
            length: {maximum: Settings.user_valid.max_length_name}
  validates :email, presence: true,
            length: {maximum: Settings.user_valid.max_length_email},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :password, presence: true,allow_nil: true,
            length: {maximum: Settings.user_valid.max_length_passwd,
                     minimum: Settings.user_valid.min_length_passwd}
end
