class ApplicationController < ActionController::Base

  # def current_employer
  #   @current_employer ||= Employer.find_by_id(session[:employer_id]) unless session[:employer_id] == nil
  # end


  def current_user
    if  Employee.find_by(id: session[:employee_id])
      @employee = current_user
    elsif Employer.find_by(id: session[:employer_id])
      @employer = current_user
    else
      redirect_to root_path
    end

  end

  # private




    # @current_uemployee ||= Employee.find_by_id(session[:employee_id]) unless session[:employee_id] == nil
    # def is_logged_in
    #   redirect_to root_path  unless current_user
    # end

end
