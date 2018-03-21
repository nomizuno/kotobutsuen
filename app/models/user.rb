class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: {user: 0, admin: 1}

  validates :name,
            presence: true,
            uniqueness: {case_sensitive: false }

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

  has_attached_file :avatar,
                    styles: { medium: '300×300>',thumb: '100×100>'},
                    default_url: '/default_user.jpg'

  validates_attachment_content_type :avatar,
                                  content_type: /image/


end
