class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        case resource
        when Admin
          admins_items_path
        when EndUser
          publics_end_users_path
        end
    end
    def after_sign_out_path_for(resource_or_scope)
        if resource_or_scope == :admin
            new_admin_session_path
        elsif resource_or_scope == :end_user
          new_end_user_session_path
        end
      end
end
