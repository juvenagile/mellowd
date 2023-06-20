class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      current_user.chatrooms
    end
  end

  def show?
    # Define the authorization rules for the show action here
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
