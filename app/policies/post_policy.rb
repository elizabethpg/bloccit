class PostPolicy < ApplicationPolicy

  class Scope < Scope

    def resolve
      if @user
        if user.admin? || user.moderator?
          scope.all
        else
          scope.where(:user => user)
        end
      else
        scope.none
      end
    end
  end

  def index?
    true
  end
end