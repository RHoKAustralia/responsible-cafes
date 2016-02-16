class User
  include Mongoid::Document
  include RoleModel
  include AccessibleAttributes

  attr_accessible :email,
    :password,
    :password_confirmation,
    :business_name,
    :address_line_1,
    :address_line_2,
    :suburb,
    :postcode,
    :state,
    :discount,
    :phone,
    :about,
    :contact_person,
    :website,
    :facebook,
    :instagram,
    :twitter,
    :motivation,
    :postype,
    :posreusablebutton,
    :posreusablebuttondetails,
    :posjoinprogram,
    :posjoinprogramdetails,
    :sustainstraws,
    :sustainbags,
    :sustaingrinds,
    :sustaincutlery,
    :sustainlocalsupport,
    :sustainbuylocal,
    :sustaincups,
    :sustainenergy,
    :sustainfinance,
    :sustainhomegrown,
    :sustainrecycle,
    :sustainfoodwaste,
    :sustainstrawscomments,
    :sustainbagscomments,
    :sustaingrindscomments,
    :sustaincutlerycomments,
    :sustainlocalsupportcomments,
    :sustainbuylocalcomments,
    :sustaincupscomments,
    :sustainenergycomments,
    :sustainfinancecomments,
    :sustainhomegrowncomments,
    :sustainrecyclecomments,
    :sustainfoodwastecomments


  # IMPORTANT:
  # Define available roles. Add any new role by APPENDING on the right. Otherwise
  # the bit mask will screw up!!!!
  # Also remember to add to ROLES_ORDER
  roles :admin, :reseller, :user, :guest

  # Order the above roles from permissive to least permissive (left to right) here
  ROLES_ORDER = [:admin, :reseller, :user, :guest]
  DEFAULT_ROLE = :user # default role is user

  roles_attribute :roles_mask
  field :roles_mask, :type => Integer, :default => self.mask_for(DEFAULT_ROLE)

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  validates :email,
    :presence => true,
    :uniqueness => true

  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  field :business_name, type: String
  validates :business_name,
    presence: true

  field :address_line_1, type: String
  validates :address_line_1,
    presence: true
  field :address_line_2, type: String

  field :suburb, type: String
  validates :suburb,
    presence: true

  field :postcode, type: String
  validates :postcode,
    presence: true

  field :state, type: String
  validates :state,
    presence: true
    
  field :phone, type: String
  validates :phone,
    presence: true

  field :discount, type: String
  validates :discount,
    presence: true

  field :about, type: String
  validates :about,
    presence: true

  field :contact_person, type: String
  validates :contact_person,
    presence: true

  field :website, type: String

  field :facebook, type: String

  field :instagram, type: String

  field :twitter, type: String

  field :motivation, type: String


  field :postype, type: String

  field :posreusablebutton, :type => Boolean, :default => false

  field :posreusablebuttondetails, type: String

  field :posjoinprogram, :type => Boolean, :default => false

  field :posjoinprogramdetails, type: String

  
  field :sustainstraws, :type => Boolean, :default => false

  field :sustainstrawscomments, :type => String

  field :sustaingrinds, :type => Boolean, :default => false

  field :sustaingrindscomments, :type => String

  field :sustainbags, :type => Boolean, :default => false

  field :sustainbagscomments, :type => String

  field :sustainbuylocal, :type => Boolean, :default => false

  field :sustainbuylocalcomments, :type => String

  field :sustaincutlery, :type => Boolean, :default => false

  field :sustaincutlerycomments, :type => String

  field :sustaincups, :type => Boolean, :default => false

  field :sustaincupscomments, :type => String

  field :sustainlocalsupport, :type => Boolean, :default => false

  field :sustainlocalsupportcomments, :type => String

  field :sustainhomegrown, :type => Boolean, :default => false

  field :sustainhomegrowncomments, :type => String

  field :sustainrecycle, :type => Boolean, :default => false

  field :sustainrecyclecomments, :type => String

  field :sustainfoodwaste, :type => Boolean, :default => false

  field :sustainfoodwastecomments, :type => String

  field :sustainenergy, :type => Boolean, :default => false

  field :sustainenergycomments, :type => String

  field :sustainfinance, :type => Boolean, :default => false

  field :sustainfinancecomments, :type => String



  has_many :cup_usages

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String

  # Check if the user has the specified role or higher
  def role_greater_or_equal_to?(role_to_check)
    self.roles.each do |role|
      return true if ROLES_ORDER.index(role_to_check) >= ROLES_ORDER.index(role)
    end
    return false
  end

  # Gets all available roles with their mask in a hash
  def self.roles_hash
    roles_hash = {}
    
    self.valid_roles.each do |role|
      roles_hash[role] = User.mask_for role
    end

    roles_hash    
  end

  def self.user_hash(users)
    user_hash = {}
    
    users.each do |user|
      user_hash[user.email] = user.id
    end

    user_hash    
  end
end
