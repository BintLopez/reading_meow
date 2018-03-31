class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :cat_reading_wrangler
  has_one :cat
  has_many :contacts, as: :contactable

  attr_accessor :account_type

  def role

  end
end