module EmployersHelper
  def current_user
    @current_user ||= Employer.find_by_id(session[:employer_id]) unless session[:mployer_id] == nil
  end
end
