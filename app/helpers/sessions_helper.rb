module SessionsHelper
  def sign_in(expert)
    cookies.permanent[:remember_token] = expert.remember_token
    current_expert = expert
  end

  def signed_in?
    !current_expert.nil?
  end

  def current_expert=(expert)
    @current_expert = expert
  end

  def current_expert
    @current_expert ||= expert_from_remember_token
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end

  private

    def expert_from_remember_token
      remember_token = cookies[:remember_token]
      Expert.find_by_remember_token(remember_token) unless remember_token.nil?
    end
end
