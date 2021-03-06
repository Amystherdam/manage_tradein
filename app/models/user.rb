class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile, dependent: :destroy
  
  accepts_nested_attributes_for :user_profile

  def with_user_profile
    build_user_profile if user_profile.nil?
    self
  end
end
