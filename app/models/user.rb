class User < ActiveRecord::Base
  attr_accessor :login, :avatar, :avatar_cache, :remove_avatar
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  has_many :reviews
  has_many :venues

  mount_uploader :avatar, AvatarUploader

  def image
    filename = "#{username.gsub(" ", "_")}.jpg"
    path = "#{Rails.root}/public/images/#{filename}"
    if File.exists?(path)
      return filename
    else
      return avatar.url
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, authentication_keys: { login: true }

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(['lower(username) = :value OR
        lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_hash).first
    end
  end
end
