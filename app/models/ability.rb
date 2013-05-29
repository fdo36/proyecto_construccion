# 2013 (c) Felipe Astroza A.

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.super_admin?
        can :manage, :all
    else
        supported_models = Astrotils::get_models_name
        for role in user.roles
            for access_right in role.access_rights
                if supported_models.member? access_right.model_name
                    model_class = Object.const_get(access_right.model_name)
                    allowed_actions = ["create", "read", "update", "destroy", "manage"]
                    if allowed_actions.member? access_right.action
                      if access_right.model_name == "Company"
                        id_attr = :id
                      else
                        id_attr = :company_id
                      end
                      can access_right.action.to_sym, model_class, id_attr => user.company_id
                    end
                end
            end
        end
    end
  end
end
