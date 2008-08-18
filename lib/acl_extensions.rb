module AclExtensions
  def is_updatable_by(user)
    user != nil
  end

  def is_deletable_by(user)
    user != nil
  end

  def self.is_readable_by(user, object = nil)

  end

  def self.is_creatable_by(user)
    user != nil
  end
end