class OmniauthController < ApplicationController

    def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
        else
            flash[:error] = 'You failed to log in with google. Please try again.'
            redirect_to new_user_registration_url
        end
    end

    def failure
        flash[:error] = "Please try different email."
        redirect_to new_user_registration_url
    end

end
