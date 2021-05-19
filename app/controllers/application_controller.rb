class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception   
    skip_before_action :verify_authenticity_token

    # Tell Devise to redirect after sign_in
    def after_sign_in_path_for(resource_or_scope)
        'https://www.recharles.xyz/'
    end
  
    # Tell Devise to redirect after sign_out
    def after_sign_out_path_for(resource_or_scope)
        'https://www.recharles.xyz/'
    end 
end