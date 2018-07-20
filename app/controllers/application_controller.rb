class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
   def logged_in?
    !!current_user
  end
  
  def current_user
    if Employer.find_by_id(session[:employer_id]) 
      @current_user ||= Employer.find_by_id(session[:employer_id])
    elsif Employee.find_by_id(session[:employee_id]) 
      @current_user ||= Employee.find_by_id(session[:employee_id])
    else
      nil
    end
  end



  private


  # def current_user
  #    if Employee.find_by_id(session[:employee_id]) || Employer.find_by_id(session[:employer_id])
  # end

# def current_employer
  #   @current_employer ||= Employer.find_by_id(session[:employer_id]) unless session[:employer_id] == nil
  # end



    # @current_uemployee ||= Employee.find_by_id(session[:employee_id]) unless session[:employee_id] == nil
    def require_logged_in
      redirect_to root_path unless logged_in?
    end




  # def current_user
  #   if @current_user != nil || @current_user != ""
  #     @current_user
  #   else
  #     if  Employee.find_by(id: session[:employee_id])
  #       @employee = Employee.find_by(id: session[:employee_id])
  #       # binding.pry
  #     elsif Employer.find_by(id: session[:employer_id])
  #       @employer = current_user
  #     else
  #       redirect_to root_path
  #     end
  #   end
  #
  # end
end
