class JobsController < ApplicationController
  # before_action :employer, only: [new]
  # before_action :logged_in
  # skip_before_action :logged_in, only: [:new, :create, :show, :index ]
  def new
    @employer = Employer.find_by(id: params[:employer_id])
    @job = Job.new
    # binding.pry
  end

  def create
    @employer = Employer.find_by(id: params[:employer_id])
    @job = Job.new(title: params[:job][:title], address: params[:job][:address], state: params[:job][:state],date: params[:job][:date])
    @job.employer = @employer
    if @job.save
      redirect_to employer_job_path(@employer, @job)
    else
      render :new
    end
  end

def show
  # binding.pry
  @job = Job.find_by(id: params[:id])
  @employer = Employer.find_by(id: params[:employer_id])
  @employee = Employee.find_by(id: params[:employee_id])
  if @employee
    @job.employee = @employee
    # @job.update(employee_id: params[:employee_id])
  end
end

def index
  # @employer = Employer.find_by(id: params[:employer_id])
  @employee = Employee.find_by(id: params[:employee_id])
  @jobs = Job.all
end

def upcoming_jobs
  # binding.pry
  # @jobs = Job.future_jobs(Time.now)
  @employee = Employee.find_by(id: params[:employee_id])
  @jobs = Job.future_jobs(Date.today)
end

def destroy
  # binding.pry
  @employee = Employee.find_by(id: params[:employee_id])
  @job = Job.find_by(id: params[:job_id])
  @job.destroy

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
