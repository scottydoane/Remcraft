module AclExtensions
  def is_updatable_by(user)
    current_user != nil
  end

  def is_deletable_by(user)
    current_user != nil
  end

  def self.is_readable_by(user, object = nil)

  end

  def self.is_creatable_by(user)
    current_user != nil
  end
end