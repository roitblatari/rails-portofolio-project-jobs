module EmployeesHelper
  def current_user
    @current_user ||= Employee.find_by_id(session[:employee_id]) unless session[:mployee_id] == nil
  end
end
