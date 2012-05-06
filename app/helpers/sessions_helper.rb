module SessionsHelper
  def sign_in(expert)
    cookies.permanent[:remember_token] = expert.remember_token
    current_expert = expert
  end

      def signed_in_expert
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

  def current_expert=(expert)
    @current_expert = expert
  end

  def current_expert
    @current_expert ||= expert_from_remember_token
  end

  def current_expert?(expert)
    expert == current_expert
  end

  def signed_in?
    !current_expert.nil?
  end

  def sign_out
    current_expert = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  private

    def expert_from_remember_token
      remember_token = cookies[:remember_token]
      Expert.find_by_remember_token(remember_token) unless remember_token.nil?
    end

    def clear_return_to
      session.delete(:return_to)
    end
end
