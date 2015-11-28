class CupUsage
  include Mongoid::Document

  field :year, :type => Integer
  field :month, :type => Integer
  validates :year, uniqueness: {scope: :month}
  
  field :reusable_cups, :type => Integer
  field :disposable_cups, :type => Integer
  field :dine_in_cups, :type => Integer

  belongs_to :user
end
