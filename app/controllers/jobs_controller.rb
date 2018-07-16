class JobsController < ApplicationController
  # before_action :employer, only: [new]

  def new
    @employer = Employer.find_by(id: params[:employer_id])
    @job = Job.new
    # binding.pry
  end

  def create
    @employer = Employer.find_by(id: params[:employer_id])
    @job = Job.new(title: params[:job][:title], address: params[:job][:address], state: params[:job][:state])
    @job.employer = @employer
    @job.save

    redirect_to employer_job_path(@employer, @job)
  end

def show
  @job = Job.find_by(id: params[:id])
  @employer = Employer.find_by(id: params[:employer_id])
  @employee = Employee.find_by(id: params[:employee_id])

  if @employee != nil
    @job.employee = @employee
  end

end

def index
  # binding.pry
  @employee = Employee.find_by(id: params[:employee_id])
  @jobs = Job.all
end

def destroy
  @employee = Employee.find_by(id: params[:employee_id])
  binding.pry
  @job = Job.find_by(id: params[:id])
  @job.destroy
  # @job.delete
  redirect_to employee_jobs_path(@employee)
end

private

  # def job_params
  #   params.require(:job).permit( :employer_id, :title, :address, :state, :date)
  # end

  # def employer
  #   @employer = Employer.find_by(id: params[:employer_id])
  # end

end
