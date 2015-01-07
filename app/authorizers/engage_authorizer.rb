class EngageAuthorizer < ApplicationAuthorizer

  def self.creatable_by?(user, option={})
    (user != option[:for].user && option[:for].engages.where(user: user).size.zero?) || user.has_role?(:admin)
  end

  def readable_by?(user, parent)
    resource.user == user || parent.user == user || user.has_role?(:admin)
  end

  def updatable_by?(user)
    resource.user == user || user.has_role?(:admin)
  end

  def deletable_by?(user)
    (resource.user == user && resource.comments.size == 0) || user.has_role?(:admin)
  end
end