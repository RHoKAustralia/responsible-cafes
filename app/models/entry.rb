class Entry
  include Mongoid::Document
  include AccessibleAttributes
  include Mongoid::Timestamps
  include Mongoid::Slug

  # belongs_to :reseller
  # belongs_to :string_product
  has_many :votes

  attr_accessible :full_name,
    :email, :guess_weight, :racquet_name
     #, :full_address,:entry_image, :entry_image_cache,
    # :phone_number, :reseller, :entry_image, :entry_image_cache,
    # :sport, :why, :change, :gender, :age, :guess_tension

  slug :full_name, :history => true

  field :full_name, type: String
  validates :full_name,
    presence: true

  field :email, type: String
  validates :email,
    presence: true,
    uniqueness: true

  # field :full_address, type: String
  
  # field :phone_number, type: String
  
  # field :sport, type: String
  # validates :sport,
  #   presence: true  

  # field :gender, type: String
  # validates :gender,
  #   presence: true

  # field :age, type: String
  # validates :age,
  #   presence: true

  # field :why, type: String
  # validates :why,
  #   presence: true

  field :racquet_name, type: String
  validates :racquet_name,
    presence: true

  field :guess_weight, type: Float
  validates :guess_weight,
    presence: true

  # field :guess_tension, type: Float
  # validates :guess_tension,
  #   presence: true


  field :vote_count, type: Integer, default: 0
  field :bonus_votes, type: Integer, default: 0
  
  # Admin only
  field :approved, type: Boolean
  field :collected, type: Boolean

  # mount_uploader :entry_image, EntryImageUploader
  # validates :entry_image,
  #   presence: true


  scope :approved, where(approved: true)


  def vote_up(params, ip)
    if has_voted? params[:email]
      return { error: 'You have already voted'}
    end

    vote = Vote.new(
      email: params[:email],
      full_name: params[:full_name],
      marketing_consent: params[:marketing_consent],
      ip: ip
    )

    votes << vote
    
    save
  end

  def has_voted?(email)
    votes.where(email: email).count > 0
  end

  def total_votes
    bonus_votes + vote_count
  end
end