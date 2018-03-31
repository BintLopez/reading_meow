class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :cat_reading_wrangler
  has_one :cat
  has_many :contacts, as: :contactable

  attr_accessor :account_type

  VALID_ROLES = {
  	admin: "admin",
  	cat: "cat",
  	wrangler: "wrangler"
  }.freeze

  def role
  	if admin?
  		VALID_ROLES[:admin]
  	elsif cat || new_cat_account?
  		VALID_ROLES[:cat]
  	elsif cat_reading_wrangler || new_wrangler_account?
  		VALID_ROLES[:wrangler]
  	else
  		raise NotImplementedError.new("User #{self.id} does not have a role!")
  	end
  end

  def new_cat_account?
  	new_account? && account_type == VALID_ROLES[:cat]
  end

  def new_wrangler_account?
  	new_account? && account_type == VALID_ROLES[:wrangler]
  end

  def new_account?
  	!cat && !cat_reading_wrangler && !admin
  end

end



