class JobsController < ApplicationController

  def new
    @employer = Employer.find_by(id: params[:employer_id])
    @job = Job.new
    # binding.pry
  end

  def create
    @employer = Employer.find_by(id: params[:employer_id])
    @job = Job.new(job_params)
    @job.employer = @employer
    if @job.save
      redirect_to employer_job_path(@employer, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find_by(id: params[:id])
    @employer = Employer.find_by(id: params[:employer_id])
    @employee = Employee.find_by(id: params[:employee_id])
  end

  def take_job
    @employee = Employee.find_by(id: params[:employee_id])
    @job = Job.find_by(id: params[:job_id])
    @job.update(employee_id: params[:employee_id])

    redirect_to employee_job_path(@employee, @job)
  end

  def index
    # @employer = Employer.find_by(id: params[:employer_id])
    @employee = Employee.find_by(id: params[:employee_id])
    @jobs = Job.all
  end

  def upcoming_jobs
    @employee = Employee.find_by(id: params[:employee_id])
    @jobs = Job.future_jobs
  end

  def past_jobs
    @employee = Employee.find_by(id: params[:employee_id])
    @jobs = Job.past_jobs
  end

  def my_created_jobs
    @employer = Employer.find_by(id: params[:employer_id])
    @jobs = @employer.jobs
  end

  def destroy
    # binding.pry
    @employee = Employee.find_by(id: params[:employee_id])
    @job = Job.find_by(id: params[:job_id])
    @job.destroy

    redirect_to employee_jobs_path(@employee)
  end

private

  def job_params
    params.require(:job).permit(:title, :address, :state, :date)
  end

  # def employer
  #   @employer = Employer.find_by(id: params[:employer_id])
  # end

end
