class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name,
            presence: true,
            uniqueness: {case_sensitive: false }
  validates_format_of :name, with: /^[a-zA-Z0-9_¥.]^/, multiline: true
  validate :validate_name

  attr_accessor :login

  def login=(login)
    @login = login
  end

  def login
    @login || self.name || self.email
  end

  def validate_name
    errors.add(:name, :invalid) if User.where(email: name).exists?
  end


  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    conditions[:email].downcase! if conditions[:email]
    login = conditions.delete(:login)

    where(conditions.to_hash).where(
      ["lower(name) = :value OR lower(email) = :value",
      {value: login.downcase}]
    ).first

  end

end
