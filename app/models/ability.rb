class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities


    #set a guest user up
    unless(user)
     user = User.new
     user.roles_mask = User.mask_for :guest
   end

    # ENTRY
    # ============================
    can [:create, :show, :vote_up, :confirm_vote], Entry

    can [:index], Entry if user.role_greater_or_equal_to? :reseller
    can [:collected, :uncollected], Entry do |passed_entry|
      reseller = passed_entry.reseller
      user.role_greater_or_equal_to?(:reseller) && reseller.user_ids.contains(user.id)
    end

    # USER
    # ============================
    can [:create], User
    can [:index], :dashboard if user.role_greater_or_equal_to? :user

    if user.role_greater_or_equal_to? :user
      can [:show, :update, :destroy], User do |passed_user|
        passed_user.id == user.id
      end
    end
  end
end
