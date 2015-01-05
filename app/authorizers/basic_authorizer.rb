class BasicAuthorizer < ApplicationAuthorizer

  def self.creatable_by?(user)
    user.has_role?(:user)
  end

  def updatable_by?(user)
    resource.user == user || user.has_role?(:admin)
  end

  def deletable_by?(user)
    resource.user == user || user.has_role?(:admin)
  end

end