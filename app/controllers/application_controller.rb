class ApplicationController < ActionController::API
    include ::ActionController::Cookies


    def current_user
        User.find_by(id: session[:user_id])
        # User.find_by_id(session[:current_user_id])
      end
    
      def logged_in?
        !!current_user
      end

      private

      def set_session
          session[:user_id] = @user.id
      end




end
