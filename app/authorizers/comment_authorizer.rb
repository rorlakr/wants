class CommentAuthorizer < ApplicationAuthorizer

  def self.creatable_by?(user)
    resource.user == user || user.has_role?(:admin)
  end

  def updatable_by?(user)
    resource.user == user || user.has_role?(:admin)
  end

  def deletable_by?(user)
    resource.user == user || user.has_role?(:admin)
  end
end