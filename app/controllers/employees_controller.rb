class EmployeesController < ApplicationController
  before_action :logged_in
  skip_before_action :logged_in, only: [:new, :create, :index]

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      session[:employee_id] = @employee.id
      redirect_to employee_path(@employee)
    else
      redirect_to root_path
    end
  end

  def show
    @current_user = current_user
    # binding.pry
    @employee = Employee.find_by(id: params[:id])
  end


private
  def employee_params
    params.require(:employee).permit(:name, :uid , :email, :profession, :password)
  end

  def employee_session
      session[:employee_id] = @employee.id
  end

end
