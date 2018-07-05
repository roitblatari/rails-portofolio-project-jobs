class EmployeesController < ApplicationController
  def new
    @employee = Employee.new 
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save

    # binding.pry
    redirect_to employee_path(@employee)
  end

  def show
    @employee = Employee.find_by(id: params[:id])
  end


  private
    def employee_params
      params.require(:employee).permit(:name, :uid , :email, :profession, :password)
    end
end
