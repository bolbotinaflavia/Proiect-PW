
class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(email: params['email'])
        if user.present? && user.authenticate(params['password'])
            log_in(user)
            redirect_to user_path(user)
        else
            flash[:error]='Invalid credentials'
            redirect_to '/login'
        end
  end

  def destroy
      log_out
        redirect_to login_path
  end
end
