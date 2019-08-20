class User < ApplicationRecord

  has_many :address
  has_many :orders
  has_many :likes, dependent: :destroy

   mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:invitable, :confirmable,:omniauthable, :omniauth_providers => [:facebook,:google_oauth2],authentication_keys: [:login]

   def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name.downcase.tr!(" ", "_")   # assuming the user model has a name
      user.image = auth.info.image
    end
  end

  attr_accessor :login

   

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

  private
    def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end

end
