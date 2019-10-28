module SessionsHelper
    def current_usr
        @current_usr ||= Usr.find_by(id: session[:usr_id])
      end
      def logged_in?
        current_usr.present?
      end
end
