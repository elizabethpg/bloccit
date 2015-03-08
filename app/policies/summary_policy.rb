class SummaryPolicy < ApplicationPolicy
  attr_reader :user, :post
  
  def initialize(user, post)
    @user = user
    @post = post
  end
  
  def show?
    @user.present?
  end
  
  def update?
    show?
  end
  
  def edit?
    show?
  end
  
end