class ApplicationController < ActionController::Base
  include Pundit::Authorization

  layout "application"
  allow_browser versions: :modern
  before_action :authenticate_user!


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
end

  private

    def user_not_authorized
      flash[:alert] = "voce não tem autorização para modificar os itens."
      redirect_back_or_to(root_path)
    end


    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end
