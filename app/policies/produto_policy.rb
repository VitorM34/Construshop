
class ProdutoPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.none unless user

      if user.admin? || user.has_role?(:moderator)
        scope.all
      else
        scope.where("estoque > 0")
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user&.admin?
  end

  def new?
    create?
  end

  def update?
    user&.id == record.user.id
  end

  def edit?
    update?
  end

  def destroy?
    user&.id == record.user.id
  end
end
