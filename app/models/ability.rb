class Ability
  include CanCan::Ability

  def initialize(user)
    if !user.role.nil?
      user.role.permissions.each do |permission|
        if permission.subject_class == "all"
          can permission.action.map { |x| x.to_sym } , permission.subject_class.to_sym
        else
          can permission.action.map { |x| x.to_sym }, permission.subject_class.constantize
        end
      end
    end
  end
end
